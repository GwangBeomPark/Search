//
//  MemoryStorage.swift
//  Search
//
//  Created by gwangbeom on 28/03/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import Foundation

class MemoryStorage<T: AnyObject>: Storage {
    
    typealias Value = T
    
    private let cache = NSCache<NSString, Value>()
    private let lock = NSLock()

    func isStored(forKey key: String) -> Bool {
        return value(forKey: key) != nil
    }
    
    func value(forKey key: String) -> Value? {
        lock.lock()
        defer { lock.unlock() }
        return cache.object(forKey: key as NSString)
    }

    func store(value: Value, forKey key: String) {
        lock.lock()
        defer { lock.unlock() }
        cache.setObject(value, forKey: key as NSString)
    }
    
    func remove(forKey key: String) {
        lock.lock()
        defer { lock.unlock() }
        cache.removeObject(forKey: key as NSString)
    }
    
    func removeAll() {
        lock.lock()
        defer { lock.unlock() }
        cache.removeAllObjects()
    }
}
