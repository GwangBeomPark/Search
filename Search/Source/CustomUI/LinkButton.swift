//
//  LinkButton.swift
//  Search
//
//  Created by gwangbeom on 03/04/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import UIKit

class LinkButton: UIButton {
    
    var linkURL: URL? {
        didSet {
            isEnabled = linkURL != nil
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            layer.borderColor = titleColor(for: state)?.cgColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSelf()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSelf()
    }

    private func setupSelf() {
        layer.borderWidth = 1
        layer.cornerRadius = 3
        isEnabled = false
        addTarget(self, action: #selector(moveToLink), for: .touchUpInside)
    }
    
    @objc
    private func moveToLink() {
        guard let url = linkURL else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
