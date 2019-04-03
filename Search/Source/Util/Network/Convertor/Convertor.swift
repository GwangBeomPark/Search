//
//  Convertor.swift
//  Search
//
//  Created by gwangbeom on 31/03/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import Foundation

protocol Convertor {
    
    associatedtype ConvertedObject
    
    func convert() -> ConvertedObject?
}
