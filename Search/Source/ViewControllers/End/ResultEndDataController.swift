//
//  ResultEndDataController.swift
//  Search
//
//  Created by gwangbeom on 03/04/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import UIKit

class ResultEndDataController {
    
    var model: Presentable
    var results: [Presentable] = []
    
    init(model: Presentable, results: [Presentable]) {
        self.model = model
        self.results = results
    }
    
    func cellSize(with collectionView: UICollectionView) -> CGSize {
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return .zero
        }
        let cellWidth = (collectionView.bounds.width - flowLayout.sectionInset.left - flowLayout.sectionInset.right - flowLayout.minimumInteritemSpacing) / 2
        return CGSize(width: cellWidth, height: cellWidth + 95)
    }
    
    func headerViewSize(with collectionView: UICollectionView) -> CGSize {
        let headerWidth = collectionView.bounds.width
        return CGSize(width: headerWidth, height: headerWidth + 190)
    }
}
