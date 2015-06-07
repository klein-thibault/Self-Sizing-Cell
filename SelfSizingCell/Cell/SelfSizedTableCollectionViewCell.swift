//
//  SelfSizedTableCollectionViewCell.swift
//  SelfSizingCell
//
//  Created by Thibault Klein on 6/7/15.
//  Copyright (c) 2015 Prolific Interactive. All rights reserved.
//

import UIKit

class SelfSizedTableCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func preferredLayoutAttributesFittingAttributes(layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes! {
        var attributes: UICollectionViewLayoutAttributes = layoutAttributes.copy()
        as! UICollectionViewLayoutAttributes

        var newFrame = attributes.frame
        newFrame.size.height = 200

        attributes.frame = newFrame
        return attributes
    }

}
