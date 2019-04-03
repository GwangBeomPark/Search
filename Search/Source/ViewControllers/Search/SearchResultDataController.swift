//
//  SearchResultDataController.swift
//  Search
//
//  Created by gwangbeom on 03/04/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import UIKit

class SearchResultDataController {
    
    var results: [Presentable] = []
    private var dataLoader: DataLoader<Shop>?

    init(scrollView: UIScrollView) {
        dataLoader = DataLoader<Shop>(scrollView: scrollView, start: 1, display: 100)
    }
    
    func reset() {
        results.removeAll()
        dataLoader?.reset()
    }
    
    func search(type: SearchableType = .shop, query: String, sortType: SearchResultSortType = SearchOptionManager.sortType, completion: @escaping (Bool) -> Void) {
        // 최근 검색어 추가
        RecentQueryManager.add(query: query)
        
        dataLoader?.fetch = { start, display, callBack in
            let target = SearchTarget.search(type: type, query: query, sortType: sortType, start: start, display: display)
            NetworkRequestor.request(target: target, completion: callBack)
        }
        dataLoader?.completion = { [weak self] list in
            let isFirstLoading = self?.results.isEmpty ?? false
            self?.results.append(contentsOf: list.items)
            completion(isFirstLoading)
        }
        dataLoader?.load()
    }
}
