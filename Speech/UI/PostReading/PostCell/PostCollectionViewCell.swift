//
//  PostCollectionViewCell.swift
//  Speech
//
//  Created by flav on 27/10/2018.
//  Copyright © 2018 flav. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell, Reusable {

    @IBOutlet weak var messageLabel: UILabel!

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let autoLayoutAttributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        
        // Specify you want _full width_
        let targetSize = CGSize(width: layoutAttributes.frame.width, height: 0)
        
        // Calculate the size (height) using Auto Layout
        let autoLayoutSize = contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: UILayoutPriority.required, verticalFittingPriority: UILayoutPriority.defaultLow)
        let autoLayoutFrame = CGRect(origin: autoLayoutAttributes.frame.origin, size: autoLayoutSize)
        
        // Assign the new size to the layout attributes
        autoLayoutAttributes.frame = autoLayoutFrame
        return autoLayoutAttributes
    }
    
    fileprivate func cardShadow(cornerRadius: CGFloat) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: cornerRadius, height: cornerRadius)
        self.layer.shadowRadius = cornerRadius
    }
}

extension PostCollectionViewCell: PostCellDisplayer {
    
    func setup(message: String) {
        messageLabel.text = message
        cardShadow(cornerRadius: 4)
    }
}
