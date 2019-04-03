//
//  SearchViewController.swift
//  Search
//
//  Created by gwangbeom on 31/03/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let dataController = SearchDataController()
    private let resultController = SearchResultController.create(of: .main)
    private lazy var searchController = UISearchController(searchResultsController: resultController)
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var sortTypeButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        setupSortTypeButton()
        
        NotificationCenter.default.addObserver(self, selector: #selector(refresh), name: .DidChangeRecentQueries, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setupSortTypeButton), name: .DidChangeSortType, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func setupSearchController() {
        searchController.searchBar.delegate = resultController
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
    }
    
    @objc
    private func setupSortTypeButton() {
        sortTypeButton.title = SearchOptionManager.sortType.text
    }
    
    @objc
    private func refresh() {
        tableView.reloadData()
    }
}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataController.queries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(type: QueryCell.self, indexPath: indexPath)
        cell.queryLabel.text = dataController.queries[indexPath.item]
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        searchController.isActive = true
        searchController.searchBar.text = dataController.queries[indexPath.item]
        resultController.searchBarSearchButtonClicked(searchController.searchBar)
    }
}
