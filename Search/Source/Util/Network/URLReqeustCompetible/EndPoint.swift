//
//  EndPoint.swift
//  Search
//
//  Created by gwangbeom on 31/03/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import Foundation

struct EndPoint: URLReqeustCompetible {
    
    private struct HeaderValue {
        static let clientID = "_ry23HHeSShXzh2GGgW2"
        static let secret = "eNQFMLLzQH"
    }

    let target: TargetType
    
    func asURLRequest() throws -> URLRequest {
        var components = URLComponents(string: target.baseURLString)
        components?.path = target.path
        if target.method == .get {
            components?.queryItems = QueryItemConvertor(parameters: target.parameters).convert()
        }
        
        guard let url = components?.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = target.method.rawValue
        request.allHTTPHeaderFields = target.headers
        if target.method != .get {
//            request.httpBody = target.parameters
        }
        
        request.timeoutInterval = 30
        request.setValue(HeaderValue.clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        request.setValue(HeaderValue.secret, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        return request
    }
}
