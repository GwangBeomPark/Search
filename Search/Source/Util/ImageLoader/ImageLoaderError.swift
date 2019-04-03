//
//  ImageLoaderError.swift
//  Search
//
//  Created by gwangbeom on 31/03/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import Foundation

enum ImageLoaderError: LocalizedError {
    
    case invalidImageData
    
    var localizedDescription: String {
        switch self {
        case .invalidImageData: return "이미지가 없습니다."
        }
    }
}

extension ImageLoaderError: CustomStringConvertible {
    
    var description: String {
        return localizedDescription
    }
}
