//
//  ImageModel.swift
//  TableView
//
//  Created by Keto Nioradze on 30.10.23.
//

import UIKit

class ImageInfo {
    let image: UIImage
    let title: String
    
    init(image: UIImage, title: String) {
        self.image = image
        self.title = title
    }
    
    static let imageData = [
        ImageInfo(image: UIImage(named: "FightClub")!, title: "FightClub"),
        ImageInfo(image: UIImage(named: "Inception")!, title: "Inception"),
        ImageInfo(image: UIImage(named: "Interstellar")!, title: "Interstellar"),
        ImageInfo(image: UIImage(named: "JohnWick")!, title: "John Wick")
    ]
}
