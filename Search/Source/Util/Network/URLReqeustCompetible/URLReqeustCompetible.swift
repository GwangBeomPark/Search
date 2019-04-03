//
//  URLReqeustCompetible.swift
//  Search
//
//  Created by gwangbeom on 31/03/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import Foundation

protocol URLReqeustCompetible {
    
    func asURLRequest() throws -> URLRequest
}

extension URLRequest: URLReqeustCompetible {
    
    func asURLRequest() throws -> URLRequest {
        return self
    }
}
