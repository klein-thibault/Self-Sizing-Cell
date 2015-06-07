//
//  SelfSizedLabelCollectionViewCell.swift
//  SelfSizingCell
//
//  Created by Thibault Klein on 6/7/15.
//  Copyright (c) 2015 Prolific Interactive. All rights reserved.
//

import UIKit

class SelfSizedLabelCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var selfSizedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func preferredLayoutAttributesFittingAttributes(layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes! {
        var attributes: UICollectionViewLayoutAttributes = layoutAttributes.copy() as! UICollectionViewLayoutAttributes

        var newFrame = attributes.frame
        self.frame = newFrame

        self.setNeedsLayout()
        self.layoutIfNeeded()

        let desiredHeight: CGFloat = self.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
        newFrame.size.height = desiredHeight

        attributes.frame = frame
        return attributes
    }

}
