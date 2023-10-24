//
//  DetailSliderItemCell.swift
//  SeaAquarium
//
//  Created by Ye linn htet on 10/24/23.
//

import UIKit

class DetailSliderItemCell: UICollectionViewCell {

    @IBOutlet weak var viewOverlay: UIView!
    @IBOutlet weak var ivCover: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewOverlay.layer.cornerRadius = 20.0
        ivCover.layer.cornerRadius = 20.0
        
        viewOverlay.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        ivCover.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

}
