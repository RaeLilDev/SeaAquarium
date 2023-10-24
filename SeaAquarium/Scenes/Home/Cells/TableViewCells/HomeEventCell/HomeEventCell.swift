//
//  HomeEventCell.swift
//  SeaAquarium
//
//  Created by Ye linn htet on 10/24/23.
//

import UIKit

class HomeEventCell: UITableViewCell {

    @IBOutlet weak var viewTickets: UIView!
    @IBOutlet weak var viewParkHours: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }

    private func setupView() {
        viewTickets.layer.cornerRadius = 16.0
        viewParkHours.layer.cornerRadius = 16.0
        viewTickets.dropShadow(opacity: 0.1, radius: 4.0, width: 0, height: 4)
        viewParkHours.dropShadow(opacity: 0.1, radius: 4.0, width: 0, height: 4)
    }
    
}
