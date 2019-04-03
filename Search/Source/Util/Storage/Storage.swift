//
//  Storage.swift
//  Search
//
//  Created by gwangbeom on 30/03/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import Foundation

protocol Storage {
    
    associatedtype Value: AnyObject
    
    func isStored(forKey key: String) -> Bool
    
    func value(forKey key: String) -> Value?
    
    func store(value: Value, forKey key: String)
    
    func remove(forKey key: String)
    
    func removeAll()
}
