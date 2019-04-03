//
//  DataLoader.swift
//  Search
//
//  Created by gwangbeom on 03/04/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import UIKit

class DataLoader<T: Decodable> {
    
    private weak var scrollView: UIScrollView?
    private var observer: NSKeyValueObservation?

    private var startIndex = 1
    private var displayCount = 100
    private var totalCount = 9999 // 초기 토탈 카운트 설정
    
    private var isLoading = false
    private var isLoadable: Bool {
        return !isLoading && displayCount < totalCount
    }

    var fetch: ((Int, Int, @escaping (Result<List<T>, Error>) -> Void) -> Void)?
    var completion: ((List<T>) -> Void)?

    init(scrollView: UIScrollView?, start: Int, display: Int) {
        self.scrollView = scrollView
        startIndex = start
        displayCount = display
        
        observer = scrollView?.observe(\UIScrollView.contentOffset, options: [.new]) { [weak self] scrollView, change in
            guard let `self` = self else { return }
            let contentOffset = change.newValue ?? .zero
            let isLimitLine = scrollView.contentSize.height - contentOffset.y - UIScreen.main.bounds.height < 100
            if isLimitLine && self.isLoadable && (scrollView.isDragging || scrollView.isDecelerating) {
                self.load()
            }
        }
    }
    
    deinit {
        observer = nil
    }
    
    func reset() {
        startIndex = 1
        displayCount = 100
        totalCount = 9999
        isLoading = false
        fetch = nil
        completion = nil
    }

    func load() {
        guard isLoadable else {
            return
        }
        isLoading = true
        self.fetch?(startIndex, displayCount) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let list):
                self?.startIndex += list.items.count
                self?.totalCount = list.totalCount
                self?.completion?(list)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
