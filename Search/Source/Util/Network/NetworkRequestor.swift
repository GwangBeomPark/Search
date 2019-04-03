//
//  NetworkRequestor.swift
//  Search
//
//  Created by gwangbeom on 28/03/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import UIKit

typealias NetworkCompletion = (Data?, URLResponse?, Error?) -> Void

class NetworkRequestor {

    static func request<Model: Decodable>(target: TargetType, keyPath: String = "", completion: ((Result<Model, Error>) -> Void)?) {
        do {
            let endPoint = EndPoint(target: target)
            let urlRequest = try endPoint.asURLRequest()
            request(urlRequest, keyPath: keyPath, completion: completion)
        } catch {
            completion?(.failure(error))
        }
    }

    static func request<Model: Decodable>(_ urlRequest: URLRequest, keyPath: String = "", completion: ((Result<Model, Error>) -> Void)?) {
        request(urlRequest) { result in
            switch result {
            case .success(let data):
                do {
                    let model = try JSONDecoder().decode(Model.self, from: data, keyPath: keyPath)
                    completion?(.success(model))
                } catch {
                    completion?(.failure(error))
                }
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
    static func request(_ request: URLRequest, completion: ((Result<Data, Error>) -> Void)?) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        SessionManager.default.request(request) { data, response, error in
            var result: Result<Data, Error> = .failure(NetworkError.unknown)
            defer {
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    completion?(result)
                }
            }
            
            if let error = error {
                result = .failure(error)
                return
            }
            
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -999
            switch statusCode {
            case 200..<300:
                if let unwrappedData = data {
                    result = .success(unwrappedData)
                } else {
                    result = .failure(NetworkError.noData)
                }
            default:
                let error = NSError(domain: "NetworkResponseErrorDowmain", code: statusCode, userInfo: nil)
                result = .failure(NetworkError.error(error))
            }
        }
    }
}
