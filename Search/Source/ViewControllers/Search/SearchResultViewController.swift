//
//  SearchResultViewController.swift
//  Search
//
//  Created by gwangbeom on 02/04/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import UIKit

class SearchResultController : UITableViewController {

    private lazy var dataController = SearchResultDataController(scrollView: tableView)
    
    @IBOutlet private weak var emptyView: UIView!

    override var navigationController: UINavigationController? {
        return presentingViewController?.navigationController
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataController.results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let result = dataController.results[indexPath.item]
        let cell = tableView.dequeueReusableCell(type: SearchResultCell.self, indexPath: indexPath)
        cell.setup(item: result)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let result = dataController.results[indexPath.item]
        let endViewController = ResultEndViewController.create(of: .main)
        endViewController.dataController = ResultEndDataController(model: result, results: dataController.results)
        navigationController?.pushViewController(endViewController, animated: true)
    }
    
    private func reset() {
        dataController.reset()
        tableView.tableHeaderView = nil
        tableView.reloadData()
    }
    
    private func showEmptyView() {
        tableView.tableHeaderView = emptyView
    }
}

extension SearchResultController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, !query.isEmpty
            else { return }
        dataController.search(query: query) { [weak self] isFirstLoading in
            guard let `self` = self else { return }
            self.tableView.reloadData()
            if self.dataController.results.isEmpty {
                self.showEmptyView()
            }
            if isFirstLoading {
                Animator.defaultListAnimation(targetViews: self.tableView.visibleCells)
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        reset()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            reset()
        }
    }
}
