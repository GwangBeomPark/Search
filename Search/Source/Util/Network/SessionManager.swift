//
//  SessionManager.swift
//  Search
//
//  Created by gwangbeom on 31/03/2019.
//  Copyright © 2019 Search. All rights reserved.
//

import Foundation

class SessionManager {

    static let `default` = SessionManager(configuration: .default)
    
    private let session: URLSession
    
    private let configuration: URLSessionConfiguration
    
    private var task: URLSessionTask?
    
    init(configuration: URLSessionConfiguration = .default) {
        self.configuration = configuration
        self.session = URLSession(configuration: configuration)
    }
    
    func request(_ request: URLReqeustCompetible, completion: @escaping NetworkCompletion) {
        do {
            let urlRequest = try request.asURLRequest()
            task = session.dataTask(with: urlRequest, completionHandler: completion)
            task?.resume()
        } catch {
            completion(nil, nil, error)
        }
    }
    
    func resume() {
        task?.resume()
    }
    
    func suspend() {
        task?.suspend()
    }
    
    func cancel() {
        task?.cancel()
    }
}
