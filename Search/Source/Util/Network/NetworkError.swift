//
//  NetworkError.swift
//  Search
//
//  Created by gwangbeom on 28/03/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import Foundation

enum NetworkError: LocalizedError {
    
    case unknown
    
    case invalidURL

    case noData
    
    case keyPathNotFound
    
    case error(NSError)
    
    var localizedDescription: String {
        switch self {
        case .unknown: return "알 수 없는 오류"
        case .invalidURL: return "잘못된 URL입니다."
        case .noData: return "Data가 존재하지 않습니다."
        case .keyPathNotFound: return "keypath 값이 존재 하지 않습니다."
        case .error(let error): return "status code: \(error.code)"
        }
    }
}

extension NetworkError: CustomStringConvertible {
    
    var description: String {
        return localizedDescription
    }
}
