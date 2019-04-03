//
//  JSONDecoder+Extensions.swift
//  Search
//
//  Created by gwangbeom on 30/03/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import Foundation

extension JSONDecoder {
    
    func decode<Model: Decodable>(_ type: Model.Type, from data: Data, keyPath: String) throws -> Model {
        if keyPath.isEmpty {
            return try decode(type, from: data)
        } else {
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                if let nestedJson = (json as AnyObject).value(forKeyPath: keyPath) {
                    let nestedJsonData = try JSONSerialization.data(withJSONObject: nestedJson)
                    return try decode(type, from: nestedJsonData)
                } else {
                    throw NetworkError.keyPathNotFound
                }
            } catch {
                throw error
            }
        }
    }
}
