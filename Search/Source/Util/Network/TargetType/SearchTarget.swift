//
//  SearchTarget.swift
//  Search
//
//  Created by gwangbeom on 31/03/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import Foundation

enum SearchTarget: TargetType {
    
    // start: 1(기본값), 1000(최대)
    // display:  10(기본값), 100(최대)
    case search(type: SearchableType, query: String , sortType: SearchResultSortType, start: Int, display: Int)

    var path: String {
        switch self {
        case .search(let type, _, _, _, _): return "/v1/search/\(type.rawValue).json"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: Parameter? {
        var param: Parameter = [:]
        switch self {
        case .search(_, let query, let sortType, let start, let display):
            param["query"] = query
            param["start"] = start
            param["display"] = display
            param["sort"] = sortType.rawValue
        }
        return param
    }
}
