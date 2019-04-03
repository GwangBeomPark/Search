//
//  String+Extensions.swift
//  Search
//
//  Created by gwangbeom on 03/04/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import Foundation

extension String {
    
    func convertFromHTML() -> String {
        guard let data = data(using: .utf8) else {
            return self
        }
        return (try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil).string) ?? self
    }
}
