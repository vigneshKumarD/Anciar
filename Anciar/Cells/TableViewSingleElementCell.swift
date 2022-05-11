//
//  HomeTableViewCell.swift
//  Anciar
//
//  Created by Vignesh Kumar on 5/9/22.
//

import Foundation
import UIKit

class TableViewSingleElementCell: UITableViewCell {
    static let identifier: String = "TableViewSingleElementCell"
    @IBOutlet var singleImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.singleImageView.image = nil
    }
    
    func setImage(imagePath: String) {
        self.singleImageView.imageWithURL(imagePath)
    }
}
