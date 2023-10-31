//
//  AddNewItemToListViewController.swift
//  TableViewTask
//
//  Created by Keto Nioradze on 31.10.23.
//

import UIKit

protocol AddNewItemDelegate: AnyObject {
    func didAddItem(_ item: ImageInfo)
}

class AddNewItemToListViewController: UIViewController {
    
    weak var delegate: AddNewItemDelegate?
    
    // #MARK: - Properties
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private let selectImage: UIImageView = {
        let selectImage = UIImageView()
        return selectImage
    }()
    
    private let movieTitle: UITextField = {
        let movieTitle = UITextField()
        return movieTitle
    }()
    
    private let pickImageButton: UIButton = {
        let pickImageButton = UIButton()
        return pickImageButton
    }()
    
    private let saveButton: UIButton = {
        let saveButton = UIButton()
        return saveButton
    }()
    
    private var imageData = ImageInfo.imageData

    // #MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupStackView()
        setupMovieTitle()
        setupImage()
        setupButton()
        setupConstraints()
        setupSaveButton()
    }
    
    // #MARK: - Setup View
    private func setupView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(movieTitle)
        stackView.addArrangedSubview(selectImage)
        stackView.addArrangedSubview(pickImageButton)
        stackView.addArrangedSubview(saveButton)
    }
    
    // MARK: - Setup Properties
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 50
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupMovieTitle() {
        movieTitle.placeholder = "Movie title"
        movieTitle.textColor = .darkText
        movieTitle.textAlignment = .center
        movieTitle.backgroundColor = .systemGray5
    }
    
    private func setupImage() {
        selectImage.contentMode = .scaleAspectFit
        selectImage.clipsToBounds = true
        selectImage.widthAnchor.constraint(equalToConstant: 400).isActive = true
        selectImage.heightAnchor.constraint(equalToConstant: 800).isActive = true
    }
    
    private func setupButton() {
        pickImageButton.setTitle("Pick Photo", for: .normal)
        pickImageButton.backgroundColor = .systemMint
        pickImageButton.addTarget(self, action: #selector(pickImageButtonAction), for: .touchUpInside)
    }
    
    private func setupSaveButton() {
        saveButton.setTitle("Save", for: .normal)
        saveButton.backgroundColor = .systemPink
        saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
    }
    
    // #MARK: - Setup Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 30),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            
            pickImageButton.heightAnchor.constraint(equalToConstant: 65),
            pickImageButton.widthAnchor.constraint(equalToConstant: 300),
            
            movieTitle.heightAnchor.constraint(equalToConstant: 50),
            movieTitle.widthAnchor.constraint(equalToConstant: 300),
            
            saveButton.heightAnchor.constraint(equalToConstant: 65),
            saveButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    // #MARK: - Button Actions
    @objc func pickImageButtonAction() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    @objc func saveButtonAction() {
        guard let newItemImage = selectImage.image, let newItemTitle = movieTitle.text else {
            return
        }
        
        let newItem = ImageInfo(image: newItemImage, title: newItemTitle)
        delegate?.didAddItem(newItem)
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Delegates
extension AddNewItemToListViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            selectImage.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
