//
//  CategoryItemCell.swift
//  SeaAquarium
//
//  Created by Ye linn htet on 10/24/23.
//

import UIKit

class CategoryItemCell: UICollectionViewCell {

    @IBOutlet weak var containerIcon: UIView!
    @IBOutlet weak var ivIcon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var data: CategoryVO? {
        didSet {
            if let data = data {
                lblTitle.text = data.name
                ivIcon.image = data.icon
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerIcon.layer.cornerRadius = containerIcon.bounds.height / 2
    }

}
