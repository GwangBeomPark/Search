//
//  LoadingView.swift
//  Search
//
//  Created by gwangbeom on 31/03/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import UIKit

class LoadingView {
    
    private let indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        indicator.alpha = 0
        return indicator
    }()

    func show(in view: UIView) {
        indicator.startAnimating()
        view.addSubview(indicator)
        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        UIView.animate(withDuration: 0.5, delay: 0, options: [.beginFromCurrentState, .allowUserInteraction], animations: {
            self.indicator.alpha = 1
        }) { _ in
            
        }
    }
    
    func hide() {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.beginFromCurrentState, .allowUserInteraction], animations: {
            self.indicator.alpha = 0
        }) { _ in
            self.indicator.stopAnimating()
            self.indicator.removeFromSuperview()
        }
    }
}
