//
//  ResultItemCell.swift
//  Search
//
//  Created by gwangbeom on 03/04/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import UIKit

class ResultItemCell: UICollectionViewCell, ReuseableView {
    
    static var identifier: String = "cell"
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    @IBOutlet weak var linkButton: LinkButton!
    
    func setup(item: Presentable) {
        imageView.setImage(with: item.contentImageURL)
        titleLabel.text = item.contentTitle
        subTitleLabel.text = item.contentSubTitle
        linkButton.setTitle(item.contentDescription, for: .normal)
        linkButton.linkURL = item.contentLinkURL
    }
}
