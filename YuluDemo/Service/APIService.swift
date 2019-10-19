//
//  APIService.swift
//  YuluDemo
//
//  Created by Admin on 10/19/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation


public protocol APIService: class {
    associatedtype Model where Model:Decodable
    func load(withCompletion completion: @escaping ([Model]?, Error?) -> Void)
    func decode(_ data: Data) -> [Model]?
    func cancelLoad()
    
}

extension APIService {
    
    fileprivate func load(_ url: URL, withCompletion completion: @escaping ([Model]?, Error?) -> Void) ->  URLSessionTask {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: url, completionHandler: {  (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let data = data else {
                //completion(nil, error)
                completion(nil,error)
                return
            }
            completion(self.decode(data), error)
            //completion(error)
        })
        task.resume()
        return task
        
    }
}


public protocol APIResource {
    associatedtype Model where Model:Decodable
    var methodPath: String { get }
    var queryItems: String { get }
    func decodeData(data:Data) ->[Model]?
}


extension APIResource {
    
    var url: URL {
        let baseUrl = "http://35.154.73.71/api"
        let components = URLComponents(string: baseUrl + methodPath)!
        return components.url!
    }
    
    func decodeData(data:Data) -> [Model]? {
        let decoder = JSONDecoder()
        do {
            let jsondata = try decoder.decode([Model].self, from: data)
            return  jsondata  //try decoder.decode(Model.self, from: data)
        }
        catch {
            print(error)
            return nil
        }
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
    
    public typealias Model = Resource.Model
    public func load(withCompletion completion: @escaping ([Resource.Model]?, Error?) -> Void) {
        
        let task =  load(resource.url, withCompletion: completion)
        tasks [resource.url] = task
        
    }
    
    public func decode(_ data: Data) -> [Resource.Model]? {
       return resource.decodeData(data: data)
    }
    
    public func cancelLoad() {
        tasks[resource.url]?.cancel()
    }
    
    
//    public func load(withCompletion completion: @escaping (Resource.Model?, Error?) -> Void) {
//         load(resource.url, withCompletion: completion)
//
//    }
    
    
}
