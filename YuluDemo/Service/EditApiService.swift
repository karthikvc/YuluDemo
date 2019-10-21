//
//  EditApiService.swift
//  YuluDemo
//
//  Created by Admin on 10/21/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation


public protocol EditAPIService: class {
    associatedtype Model where Model:Decodable
    func update(withCompletion completion: @escaping (String?, Error?) -> Void)
    func decode(_ data: Data) -> [Model]?
    func cancelupdate()
    
}


extension EditAPIService {
    
     fileprivate func update(_ request: URLRequest, withCompletion completion: @escaping ([Model]?, Error?) -> Void) ->  URLSessionTask {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            
        }
        task.resume()
        
        return task
    }
}


protocol EditApiResource: APIResource {
    
    var methodType: String { get }
    //var methodPath: String { get }
}

extension EditApiResource {
    
   
    var urlRequest:URLRequest {
        let urlrequest = URLRequest(url: self.url)
        return urlrequest
    }
}
