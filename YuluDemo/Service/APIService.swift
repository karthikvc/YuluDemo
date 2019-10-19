//
//  APIService.swift
//  YuluDemo
//
//  Created by Admin on 10/19/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation


public protocol APIService: class {
    
}

extension APIService {
    
    fileprivate func load(_ url: URL, withCompletion completion: @escaping ( Error?) -> Void) ->  URLSessionTask {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: url, completionHandler: { [weak self] (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let data = data else {
                //completion(nil, error)
                completion(error)
                return
            }
            //completion(self?.decode(data), error)
            completion(error)
        })
        task.resume()
        return task
        
    }
}


public protocol APIResource {
    
    var methodPath: String { get }
    var queryItems: String { get }
    func decodeData()
}


extension APIResource {
    
    var url: URL {
        let baseUrl = " ///// "
        let components = URLComponents(string: baseUrl + methodPath)!
        return components.url!
    }
    
    func decodeData () {
        
    }
    
}


public class APIRequest<Resource: APIResource> {
    let resource: Resource
    init(resource: Resource) {
        self.resource = resource
    }
    
    var tasks:[URL:URLSessionTask] = [:]
}


extension APIRequest: APIService {
    
    public func load(withCompletion completion: @escaping ( Error?) -> Void) {
        let task = load(resource.url, withCompletion: completion)
        tasks[resource.url] = task
    }
    
    
}
