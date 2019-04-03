//
//  SortOptionViewController.swift
//  Search
//
//  Created by gwangbeom on 02/04/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import UIKit

class SortOptionViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset.top = 20
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateForPresentation(isPresent: true)
    }
    
    @IBAction func tappedCloseButton(_ sender: Any) {
        animateForPresentation(isPresent: false)
    }
    
    private func animateForPresentation(isPresent: Bool) {
        tableView.layoutIfNeeded()
        Animator.defaultListAnimation(targetViews: tableView.visibleCells, isReverse: !isPresent) { [weak self] in
            if !isPresent {
                self?.dismiss(animated: true, completion: nil)
            }
        }
    }
}

extension SortOptionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SearchResultSortType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(type: SortOptionCell.self, indexPath: indexPath)
        let type = SearchResultSortType.allCases[indexPath.item]
        cell.setup(type: type)
        return cell
    }
}

extension SortOptionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = SearchResultSortType.allCases[indexPath.item]
        SearchOptionManager.sortType = type
        tableView.reloadData()
        animateForPresentation(isPresent: false)
    }
}
