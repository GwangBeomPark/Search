//
//  List.swift
//  Search
//
//  Created by gwangbeom on 01/04/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import Foundation

struct List<Item: Decodable>: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case items
        case displayCount = "display"
        case totalCount = "total"
    }
    
    let items: [Item]
    let displayCount: Int
    let totalCount: Int
}
