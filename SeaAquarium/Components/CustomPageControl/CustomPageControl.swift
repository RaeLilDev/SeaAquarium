//
//  CustomPageControl.swift
//  SeaAquarium
//
//  Created by Ye linn htet on 10/24/23.
//

import Foundation
import UIKit

@IBDesignable
class CustomPageControl: UIStackView {
    
    @IBInspectable var dotSize: CGSize = CGSize(width: 24.0, height: 2.0) {
        didSet {
            setupViews()
            updateIndicatorBackground()
        }
    }
    @IBInspectable var dotCount: Int = 5 {
        didSet {
            setupViews()
            updateIndicatorBackground()
        }
    }
    
    @IBInspectable var currentPage: Int = 0 {
        didSet {
            updateIndicatorBackground()
        }
    }
    
    var dotViews = [UIView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        updateIndicatorBackground()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        updateIndicatorBackground()
    }
    
    private func setupViews() {
        
        clearExistingDots()
        
        for  _ in 0..<dotCount {
            let dot = UIView()
            
            dot.translatesAutoresizingMaskIntoConstraints = false
            //set views width and height
            dot.heightAnchor.constraint(equalToConstant: dotSize.height).isActive = true
            dot.widthAnchor.constraint(equalToConstant: dotSize.width).isActive = true
            dot.layer.cornerRadius = dotSize.height / 2
            //place view in stackview
            addArrangedSubview(dot)
            dotViews.append(dot)
        }
    }
    
    private func updateIndicatorBackground() {
        for (index, dot) in dotViews.enumerated() {
            dot.backgroundColor = index == currentPage ? UIColor(named: "colorPrimary") : .white
        }
    }
    
    private func clearExistingDots() {
        for dot in dotViews {
            removeArrangedSubview(dot)
            dot.removeFromSuperview()
        }
        dotViews.removeAll()
    }
    
}
