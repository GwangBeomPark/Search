//
//  QueryItemConvertor.swift
//  Search
//
//  Created by gwangbeom on 31/03/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import Foundation

struct QueryItemConvertor: Convertor {
    
    typealias ConvertedObject = [URLQueryItem]
    
    let parameters: TargetType.Parameter?
    
    func convert() -> [URLQueryItem]? {
        return parameters?.compactMap { key, value in
            URLQueryItem(name: key, value: String(describing: value))
        }
    }
}
