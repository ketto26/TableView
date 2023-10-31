//
//  ViewController.swift
//  TableView
//
//  Created by Keto Nioradze on 30.10.23.
//

import UIKit

class ViewController: UIViewController{
    
    // #MARK: - Properties
    private let plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "+"
        button.action = #selector(plusButtonClicked)
        return button
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var image = ImageInfo.imageData
    
    // #MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Movies"
        navigationItem.rightBarButtonItem = plusButton
        plusButton.target = self
        setupBackground()
        setupTableView()
        subviewSetup()
        tableViewConstraints()
    }
    
    // #MARK: - Private Methods
    private func setupBackground() {
        view.backgroundColor = .systemBackground
    }
    
    private func subviewSetup() {
        view.addSubview(tableView)
    }
    
    private func tableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 15),
            tableView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 0),
            tableView.rightAnchor.constraint(equalToSystemSpacingAfter: view.rightAnchor, multiplier: 0),
            tableView.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: -20)
        ])
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // #MARK: - Button Actions
    @objc func plusButtonClicked() {
        let addNewItemController = AddNewItemToListViewController()
        navigationController?.pushViewController(addNewItemController, animated: true)
           
    }
}

// #MARK: - DataSource & Delegates
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
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsViewController = ItemDetailsViewController()
        detailsViewController.image = image[indexPath.row]
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

extension ViewController: AddNewItemDelegate {
    func didAddItem(_ item: ImageInfo) {
        image.append(item)
        self.tableView.reloadData()
    }
}
