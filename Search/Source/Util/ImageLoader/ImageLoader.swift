//
//  ImageLoader.swift
//  Search
//
//  Created by gwangbeom on 30/03/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import UIKit

class ImageLoader {
    
    typealias Completion = (Result<UIImage, Error>) -> Void

    static let shared = ImageLoader()
    
    private let storage = MemoryStorage<UIImage>()
    private let queue = DispatchQueue(label: "com.imageloader.queue", attributes: .concurrent)

    func loadImage(with url: URL, completion: @escaping Completion) {
        if let cachedImage = storage.value(forKey: url.absoluteString) {
            completion(.success(cachedImage))
            return
        }
        queue.async {
            do {
                let data = try Data(contentsOf: url)
                if let image = UIImage(data: data) {
                    self.storage.store(value: image, forKey: url.absoluteString)
                    completion(.success(image))
                } else {
                    completion(.failure(ImageLoaderError.invalidImageData))
                }
            } catch {
                completion(.failure(error))
            }
        }
    }
}
