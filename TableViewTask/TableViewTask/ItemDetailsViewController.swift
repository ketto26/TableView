//
//  ItemDetailsViewController.swift
//  TableViewTask
//
//  Created by Keto Nioradze on 31.10.23.
//

import UIKit

class ItemDetailsViewController: UIViewController {
    
    // #MARK: - Properties
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private let movieImage: UIImageView = {
        let movieImage = UIImageView()
        return movieImage
    }()
    
    private let movieTitle: UILabel = {
        let movieTitle = UILabel()
        return movieTitle
    }()
    
    // #MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupStackView()
        setupMovieImage()
        setupMovieTitle()
    }
    
    // #MARK: - Setup View
    private func setupView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(movieImage)
        stackView.addArrangedSubview(movieTitle)
    }
    
    var image: ImageInfo?
    // #MARK: - Setup Properties
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupMovieImage() {
        movieImage.contentMode = .scaleAspectFit
        movieImage.clipsToBounds = true
        movieImage.image = image?.image
        movieImage.widthAnchor.constraint(equalToConstant: 330).isActive = true
        movieImage.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }
    
    private func setupMovieTitle() {
        movieTitle.font = UIFont(name: "Helvetica-Bold", size: 12)
        movieTitle.text = image?.title
        movieTitle.textColor = .blue
        movieTitle.backgroundColor = .systemGray5
    }
    
    // #MARK: - Setup Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            movieTitle.heightAnchor.constraint(equalToConstant: 60),
            movieTitle.widthAnchor.constraint(equalToConstant: 500)
        ])
    }
}
