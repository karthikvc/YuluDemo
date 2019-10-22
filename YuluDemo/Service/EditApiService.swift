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
    //func decode(_ data: Data) -> [Model]?
    func cancelupdate()
}


extension EditAPIService {
    
     fileprivate func update(_ request: URLRequest, withCompletion completion: @escaping (String?, Error?) -> Void) ->  URLSessionTask {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
               completion("Fail",error)
            } else {
                if let response = response as? HTTPURLResponse {
                    
                    if response.statusCode == 200 {
                        completion("Success", error)
                    }
                    else {
                        completion("Fail", error)
                    }
                }
                }
            print("data updated")
            
            
            
            do {
                let jsonData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves)
                print(jsonData)
            } catch let myJSONError {
                print(myJSONError)
            }
            
            completion(nil,error)
        }
        task.resume()
        
        return task
    }
}


public protocol EditApiResource {
    
    associatedtype Model where Model:Decodable
    var methodPath: String { get }
    //var queryItems: String { get }
    //func decodeData(data:Data) ->[Model]?
    var methodType: String { get }
    var urlRequest: URLRequest { get }
    var  myplace: MyplacesListItem { get }
    
}

extension EditApiResource {
    
        var url: URL {
            let baseUrl = "http://35.154.73.71/api"
            let components = URLComponents(string: baseUrl + methodPath)!
            return components.url!
        }
    
    var jSonData: Data {
        
       let parameterDictionary: [String : Any] = ["title" : myplace.title, "latitude" : myplace.latitude, "longitude": myplace.longitude]
       let data = try! JSONSerialization.data(withJSONObject: parameterDictionary, options: [])

        //let data = body.data(using: .utf8)!
        return data
    }
    
    var headerField:String {
        return "Content-Type"
    }
    
    var headerValue:String {
        return "Application/json"
    }
    
    var urlRequest:URLRequest {
        var urlrequest = URLRequest(url: self.url)
        urlrequest.httpMethod = methodType
       
        urlrequest.setValue(headerValue, forHTTPHeaderField: headerField)
        do {
            let json = try JSONSerialization.jsonObject(with: jSonData, options: .mutableContainers)
            print(json)
        }
        catch let error {
            print(error)
        }
        
        urlrequest.httpBody = jSonData
        return urlrequest
    }
}



public class EditApiRequest<Resource: EditApiResource> {
    
    let resource: Resource
    init(resource: Resource) {
        self.resource = resource
    }
    var tasks:[URL:URLSessionTask] = [:]
}


extension EditApiRequest:EditAPIService {
    
    public typealias Model = Resource.Model
    
    public func update(withCompletion completion: @escaping (String?, Error?) -> Void) {
        
        let urlrequest = resource.urlRequest
        let task = update(urlrequest) { (result, error) in
            completion(result,error)
        }
        tasks[resource.url] = task
    }
    
    public func cancelupdate() {
        
    }
    
}
