//
//  Presentable.swift
//  Search
//
//  Created by gwangbeom on 01/04/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import Foundation

protocol Presentable {
    
    var contentTitle: String { get }
    
    var contentSubTitle: String { get }
    
    var contentDescription: String { get }
    
    var contentImageURL: URL? { get }
    
    var contentLinkURL: URL? { get }

    var cellType: SearchResultCellType { get }
}

extension Presentable {
    
    var contentSubTitle: String {
        return ""
    }
    
    var contentDescription: String {
        return ""
    }
    
    var contentImageURL: URL? {
        return nil
    }
    
    var contentLinkURL: URL? {
        return nil
    }
}

enum SearchResultCellType: String {
    case text
    case smallImage
    case largeImage
    
    var identifier: String {
        return rawValue
    }
}
