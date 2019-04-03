//
//  TargetType.swift
//  Search
//
//  Created by gwangbeom on 29/03/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import Foundation

protocol TargetType {
    
    typealias Parameter = [String: Any]

    typealias HeaderField = [String: String]
    
    var baseURLString: String { get }

    var path: String { get }
    
    var method: HTTPMethod { get }
    
    var parameters: Parameter? { get }
    
    var headers: HeaderField? { get }
}

extension TargetType {
    
    var baseURLString: String {
        return "https://openapi.naver.com"
    }
    
    var path: String {
        return ""
    }
    
    var parameters: Parameter? {
        return nil
    }
    
    var headers: HeaderField? {
        return nil
    }
}
