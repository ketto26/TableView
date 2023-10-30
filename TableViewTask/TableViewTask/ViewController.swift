//
//  ViewController.swift
//  TableView
//
//  Created by Keto Nioradze on 30.10.23.
//

import UIKit

class ViewController: UIViewController{
    
    // #MARK: Properties
    private let plusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .tintColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .blue
        return tableView
    }()
    
    private var image = ImageInfo.imageData
    
    // #MARK: ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        subviewSetup()
        plusButtonConstraints()
        tableViewConstraints()
    }
    
    // #MARK: Private Methods
    private func setupBackground() {
        view.backgroundColor = .systemBackground
    }
    
    private func subviewSetup() {
        view.addSubview(plusButton)
        view.addSubview(tableView)
    }
    private func plusButtonConstraints() {
        NSLayoutConstraint.activate([
            plusButton.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 10),
            plusButton.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: 10),
            plusButton.heightAnchor.constraint(equalToConstant: 20),
            plusButton.widthAnchor.constraint(equalToConstant: 70),
            tableView.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: -20)
        ])
    }
    private func tableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalToSystemSpacingBelow: plusButton.bottomAnchor, multiplier: 20),
            tableView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 10),
            tableView.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: 10),
            tableView.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: -20)
        ])
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .red
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
 /*   private func setupButtonsAction() {
        plusButton.addAction(UIAction(title: "", handler: { [weak self] action in let AddNewItemToListViewController = AddNewItemToListViewController() }), for: <#T##UIControl.Event#>)
    } */
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        image.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        let imageIndex = image[indexPath.row]
        cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let imageCell = cell as? ImageTableViewCell {
            imageCell.configure(with: imageIndex)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

