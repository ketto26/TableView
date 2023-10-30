//
//  ImageTableViewCell.swift
//  TableView
//
//  Created by Keto Nioradze on 30.10.23.
//

import UIKit

final class ImageTableViewCell: UITableViewCell {
    // #MARK: Properties
    private let mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.axis = .horizontal
        mainStackView.spacing = 7
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.layoutMargins = .init(top: 8, left: 16, bottom: 8, right: 16)
        return mainStackView
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.widthAnchor.constraint(equalToConstant: 110).isActive = true
        image.heightAnchor.constraint(equalToConstant: 70).isActive = true
        return image
    }()
    
    private let title: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "Helvetica-Bold", size: 12)
        title.textColor = .blue
        return title
    }()
    
    // #MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubview()
        setupView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // #MARK: PrepareForReuse
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }
    
    // #MARK: Configure
    func configure(with model: ImageInfo) {
        title.text = model.title
        image.image = model.image
    }
    
    private func setupView() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
    }
    
    private func addSubview() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(image)
        mainStackView.addArrangedSubview(title)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
            mainStackView.leftAnchor.constraint(equalTo: self.leftAnchor),
            mainStackView.rightAnchor.constraint(equalTo: self.rightAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
