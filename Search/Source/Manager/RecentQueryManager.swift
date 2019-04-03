//
//  RecentQueryManager.swift
//  Search
//
//  Created by gwangbeom on 03/04/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import Foundation

extension Notification.Name {
    
    static let DidChangeRecentQueries = Notification.Name("DidChangeRecentQueries")
}

struct RecentQueryManager {
    
    static func add(query: String) {
        var queries = self.queries()
        if let index = queries.firstIndex(of: query) {
            queries.remove(at: index)
        } else if queries.count >= maxCount {
            queries.removeFirst()
        }
        queries.append(query)
        UserDefaults.standard.set(queries, forKey: recentQueryKey)
        NotificationCenter.default.post(name: Notification.Name.DidChangeRecentQueries, object: nil)
    }
    
    static func queries() -> [String] {
        return UserDefaults.standard.value(forKey: recentQueryKey) as? [String] ?? []
    }
    
    private static let maxCount = 5
    private static let recentQueryKey = "recentQueryKey"
}

