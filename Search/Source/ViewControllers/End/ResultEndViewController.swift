//
//  ResultEndViewController.swift
//  Search
//
//  Created by gwangbeom on 03/04/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import UIKit

class ResultEndViewController: UIViewController {
    
    var dataController: ResultEndDataController!
    
    @IBOutlet private weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelf()
    }
    
    private func setupSelf() {
        title = dataController.model.contentTitle
    }
}

extension ResultEndViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataController.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(type: ResultItemCell.self, indexPath: indexPath)
        cell.setup(item: dataController.results[indexPath.item])
        return cell
    }
}

extension ResultEndViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementrayView(type: ResultEndHeaderView.self, ofKind: kind, indexPath: indexPath)
        headerView.setup(item: dataController.model)
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return dataController.cellSize(with: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return dataController.headerViewSize(with: collectionView)
    }
}

extension ResultEndViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let result = dataController.results[indexPath.item]
        let endViewController = ResultEndViewController.create(of: .main)
        endViewController.dataController = ResultEndDataController(model: result, results: dataController.results)
        navigationController?.pushViewController(endViewController, animated: true)
    }
}
