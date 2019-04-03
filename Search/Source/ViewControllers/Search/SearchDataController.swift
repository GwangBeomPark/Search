//
//  SearchDataController.swift
//  Search
//
//  Created by gwangbeom on 01/04/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import Foundation

class SearchDataController {
    
    var queries: [String] {
        return RecentQueryManager.queries()
    }
}
