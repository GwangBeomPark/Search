//
//  UIImageView+Extensions.swift
//  Search
//
//  Created by gwangbeom on 28/03/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setImage(with url: URL?, placeholder: UIImage? = nil, completion: ImageLoader.Completion? = nil) {
        guard let url = url else { return }
        self.image = placeholder
        self.taskIdentifier = url.absoluteString

        ImageLoader.shared.loadImage(with: url) { [weak self] result in
            DispatchQueue.main.async {
                guard let `self` = self, self.taskIdentifier == url.absoluteString
                    else { return }
                switch result {
                case .success(let image):
                    self.performTransition(image: image) {
                        completion?(.success(image))
                    }
                case .failure(let error):
                    completion?(.failure(error))
                }
            }
        }
    }
    
    private func performTransition(image: UIImage, completion: (() -> Void)?) {
        UIView.transition(with: self, duration: 0.3, options: [.allowUserInteraction, .beginFromCurrentState, .transitionCrossDissolve], animations: {
            self.image = image
        }, completion: { _ in
            completion?()
        })
    }
}

extension UIImageView {
    
    private struct AssociatedKeys {
        static var taskIdentifierKey: Void?
    }
    
    private var taskIdentifier: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.taskIdentifierKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.taskIdentifierKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
