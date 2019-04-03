//
//  SortOptionCell.swift
//  Search
//
//  Created by gwangbeom on 03/04/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import UIKit

class SortOptionCell: UITableViewCell, ReuseableView {
    
    static var identifier: String = "cell"
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    func setup(type: SearchResultSortType) {
        let isCurrentType = SearchOptionManager.sortType == type
        titleLabel.font = isCurrentType ? UIFont.boldSystemFont(ofSize: 30) : UIFont.systemFont(ofSize: 20)
        titleLabel.text = type.text
    }
}
