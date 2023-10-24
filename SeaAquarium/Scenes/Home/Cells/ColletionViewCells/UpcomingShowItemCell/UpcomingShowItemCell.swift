//
//  UpcomingShowItemCell.swift
//  SeaAquarium
//
//  Created by Ye linn htet on 10/24/23.
//

import UIKit

class UpcomingShowItemCell: UICollectionViewCell {

    @IBOutlet weak var viewTime: UIStackView!
    @IBOutlet weak var ivCover: UIImageView!
    @IBOutlet weak var viewOverlay: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
    
    private func setupView() {
        viewTime.layer.cornerRadius = 6.0
        ivCover.layer.cornerRadius = 12.0
        viewOverlay.layer.cornerRadius = 12.0
    }

}
