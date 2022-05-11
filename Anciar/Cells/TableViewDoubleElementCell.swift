//
//  TableViewDoubleElementCell.swift
//  Anciar
//
//  Created by Vignesh Kumar on 5/9/22.
//

import Foundation
import UIKit

class TableViewDoubleElementCell: UITableViewCell {
    static let identifier: String = "TableViewDoubleElementCell"
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.leftImageView.image = nil
        self.rightImageView.image = nil
    }
    
    func setLeftImage(imagePath: String) {
        self.leftImageView.imageWithURL(imagePath)
    }
    
    func setRightImage(imagePath: String) {
        self.rightImageView.imageWithURL(imagePath)
    }
}
