//
//  SearchOption.swift
//  Search
//
//  Created by gwangbeom on 03/04/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import Foundation

enum SearchableType: String, CaseIterable {
    
    case shop
}

enum SearchResultSortType: String, CaseIterable {
    
    // 유사도순
    case similar = "sim"
    
    // 날짜순
    case date
    
    // 가격 오름차순
    case asc
    
    // 가격 내림차순
    case dsc
    
    var text: String {
        switch self {
        case .similar: return "유사도순"
        case .date: return "날짜순"
        case .asc: return "가격 오름차순"
        case .dsc: return "가격 내림차순"
        }
    }
}
