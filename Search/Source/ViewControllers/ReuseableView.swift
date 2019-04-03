//
//  ReuseableView.swift
//  Search
//
//  Created by gwangbeom on 03/04/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import UIKit

protocol ReuseableView {
    
    static var identifier: String { get }
}

extension UITableView {
    
    func dequeueReusableCell<Cell: UITableViewCell>(type: Cell.Type, indexPath: IndexPath) -> Cell where Cell: ReuseableView {
        return dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as! Cell
    }
}

extension UICollectionView {
    
    func dequeueReusableCell<Cell: UICollectionViewCell>(type: Cell.Type, indexPath: IndexPath) -> Cell where Cell: ReuseableView {
        return dequeueReusableCell(withReuseIdentifier: type.identifier, for: indexPath) as! Cell
    }
    
    func dequeueReusableSupplementrayView<SupplementrayView: UICollectionReusableView>(type: SupplementrayView.Type, ofKind kind: String, indexPath: IndexPath) -> SupplementrayView where SupplementrayView: ReuseableView {
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: type.identifier, for: indexPath) as! SupplementrayView
    }
}
