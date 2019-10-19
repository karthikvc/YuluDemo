//
//  MyPlacesAPIDataProvider.swift
//  YuluDemo
//
//  Created by Admin on 10/19/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation


struct MyPlacesResources:APIResource {
    
    
    var methodPath: String {
      return " "
    }
    
    var queryItems: String
    
    
}


class MyPlacesAPIDataProvider:MyPlacesListDataProvider{
    
    func fetchMovieListFor(_ query: String, completionHandler: @escaping (MyPlacesList?, Error?) -> ()) {
    
        let resource = MyPlacesResources(queryItems: query)
        let request = APIRequest()
        
        
    }
    
    func cancelTask() {
        
    }
    
    
}
