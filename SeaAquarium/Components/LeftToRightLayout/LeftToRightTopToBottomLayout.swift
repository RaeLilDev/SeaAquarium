//
//  LeftToRightTopToBottomLayout.swift
//  SeaAquarium
//
//  Created by Ye linn htet on 10/24/23.
//

import Foundation
import UIKit

class LeftToRightTopToBottomLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        
        var currentX: CGFloat = sectionInset.left
        var currentY: CGFloat = sectionInset.top
        var maxY: CGFloat = -1.0
        
        var newAttributes = [UICollectionViewLayoutAttributes]()
        
        for attribute in attributes {
            if attribute.frame.origin.y >= maxY {
                currentX = sectionInset.left
                currentY = attribute.frame.origin.y
            }
            
            var newFrame = attribute.frame
            newFrame.origin.x = currentX
            newFrame.origin.y = currentY
            
            attribute.frame = newFrame
            currentX += newFrame.width + minimumInteritemSpacing
            maxY = max(maxY, newFrame.maxY)
            newAttributes.append(attribute)
        }
        
        return newAttributes
    }
}
