//
//  UIView+Extension.swift
//  SeaAquarium
//
//  Created by Ye linn htet on 10/24/23.
//

import Foundation
import UIKit

extension UIView {
    func dropShadow(opacity: Float, radius: CGFloat, width: Int, height: Int) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize(width: width, height: height)
        layer.shadowRadius = radius
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}
