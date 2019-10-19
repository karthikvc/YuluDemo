//
//  MyPlacesAPIDataProvider.swift
//  YuluDemo
//
//  Created by Admin on 10/19/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation


struct MyPlacesResources: APIResource {
    
    typealias Model = MyPlacesJson
    
    var methodPath: String {
      return "/v1/places"
    }
    
    var queryItems: String
    
    
}


class MyPlacesAPIDataProvider:MyPlacesListDataProvider{
    
    private var apiRequest: APIRequest<MyPlacesResources>?
    
    func fetchMyPlacesListFor(_ query: String, completionHandler: @escaping (MyPlacesList?, Error?) -> ()) {
    
        let resource = MyPlacesResources(queryItems: query)
        print(resource.methodPath)
        let request = APIRequest(resource: resource)
        
        request.load { (jsonList,error) in
            completionHandler(jsonList as! MyPlacesList,error)
        }
    }
    
    func cancelTask() {
        
    }
    
    
}
