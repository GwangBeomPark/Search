//
//  Animator.swift
//  Search
//
//  Created by gwangbeom on 02/04/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import UIKit

struct Animator {
    
    static func chainingAnimate(targetViews: [UIView],
                                duration: TimeInterval,
                                delay: TimeInterval,
                                options: UIView.AnimationOptions = [.beginFromCurrentState, .allowUserInteraction],
                                prepare: ((UIView) -> Void)? = nil,
                                animations: @escaping (UIView) -> Void,
                                completion: (() -> Void)? = nil) {
        let group = DispatchGroup()
        targetViews.enumerated().forEach { offset, view in
            group.enter()
            prepare?(view)
            UIView.animate(withDuration: duration, delay: delay * Double(offset), options: [.beginFromCurrentState, .allowUserInteraction], animations: {
                animations(view)
            }, completion: { _ in
                group.leave()
            })
        }
        group.notify(queue: .main) {
            completion?()
        }
    }
}

extension Animator {
    
    static func defaultListAnimation(targetViews: [UIView], isReverse: Bool = false, completion: (() -> Void)? = nil) {
        Animator.chainingAnimate(targetViews: targetViews, duration: 0.15, delay: 0.05,
                                 prepare: { targetView in
                                    if !isReverse {
                                        targetView.alpha = 0
                                        targetView.transform = CGAffineTransform(translationX: 0, y: 10)
                                    }
                                }, animations: { targetView in
                                    targetView.alpha = isReverse ? 0 : 1
                                    targetView.transform = isReverse ? CGAffineTransform(translationX: 0, y: 10) : .identity
                                }, completion: completion)
    }
}
