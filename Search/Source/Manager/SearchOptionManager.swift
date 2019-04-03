//
//  SearchOptionManager.swift
//  Search
//
//  Created by gwangbeom on 03/04/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import Foundation

extension Notification.Name {
    
    static let DidChangeSortType = Notification.Name("DidChangeSortType")
}

struct SearchOptionManager {
    
    static var sortType: SearchResultSortType {
        get {
            let rawValue = UserDefaults.standard.string(forKey: sortTypeKey) ?? ""
            return SearchResultSortType(rawValue: rawValue) ?? .date
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: sortTypeKey)
            NotificationCenter.default.post(name: .DidChangeSortType, object: nil)
        }
    }
    
    private static let sortTypeKey = "sortTypeKey"
}
