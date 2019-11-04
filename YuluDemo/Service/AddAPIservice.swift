//
//  AddAPIservice.swift
//  YuluDemo
//
//  Created by Admin on 10/22/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation



public protocol AddApiResource: EditApiResource {
    
    
}


extension AddApiResource {
    
    var headerField:String {
        return "Content-Type"
    }
    
    var headerValue:String {
        return "application/x-www-form-urlencoded"
    }
    
    
    var jSonData: Data {
     
        
        var urlParser = URLComponents()
        urlParser.queryItems = [
            URLQueryItem(name: "title", value: myplace.title),
            URLQueryItem(name: "latitude", value: String (myplace.latitude)),
            URLQueryItem(name: "longitude", value: String(myplace.longitude)),
            URLQueryItem(name: "description", value: String(myplace.description))
        ]
        let httpBodyString = urlParser.percentEncodedQuery
        
        //let data = body.data(using: .utf8)!
        return (httpBodyString?.data(using: .utf8))!
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
