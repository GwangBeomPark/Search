//
//  Shop.swift
//  Search
//
//  Created by gwangbeom on 03/04/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import Foundation

struct Shop: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case title
        case mallName
        case lowPrice = "lprice"
        case highPrice = "hprice"
        case imageURLStr = "image"
        case linkURLStr = "link"
    }
    
    let title: String
    let mallName: String
    let lowPrice: Int
    let highPrice: Int
    let imageURLStr: String
    let linkURLStr: String
    
    var imageURL: URL? {
        return URL(string: imageURLStr)
    }
    
    var linkURL: URL? {
        return URL(string: linkURLStr)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        mallName = try container.decode(String.self, forKey: .mallName)
        let lowPriceStr = try container.decode(String.self, forKey: .lowPrice)
        lowPrice = Int(lowPriceStr) ?? 0
        let highPriceStr = try container.decode(String.self, forKey: .highPrice)
        highPrice = Int(highPriceStr) ?? 0
        imageURLStr = try container.decode(String.self, forKey: .imageURLStr)
        linkURLStr = try container.decode(String.self, forKey: .linkURLStr)
    }
}

extension Shop: Presentable {
    
    var contentTitle: String {
        return title.convertFromHTML()
    }
    
    var contentSubTitle: String {
        return "\(lowPrice)원 최저"
    }
    
    var contentDescription: String {
        return mallName
    }

    var contentImageURL: URL? {
        return imageURL
    }
    
    var contentLinkURL: URL? {
        return linkURL
    }
    
    var cellType: SearchResultCellType {
        return .smallImage
    }
}
