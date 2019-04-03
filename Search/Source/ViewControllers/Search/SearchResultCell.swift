//
//  SearchResultCell.swift
//  Search
//
//  Created by gwangbeom on 02/04/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell, ReuseableView {
    
    static var identifier: String = "cell"
    
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var subTitleLabel: UILabel?
    @IBOutlet private weak var descriptionLabel: UILabel?
    @IBOutlet private weak var contentImageView: UIImageView?
    
    func setup(item: Presentable) {
        titleLabel?.text = item.contentTitle
        subTitleLabel?.text = item.contentSubTitle
        descriptionLabel?.text = item.contentDescription
        contentImageView?.setImage(with: item.contentImageURL)
    }
}
