//
//  MyplaceEditAPIDataProvider.swift
//  YuluDemo
//
//  Created by Admin on 10/21/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

struct placeEditApiResource: EditApiResource {
    var myplace: MyplacesListItem
    
   typealias Model = MyPlacesJson
    
    var methodPath: String {
       return "/v1/places/\(myplace.placeId)"
    }
    
    var methodType: String {
        return "PUT"
    }
}

class MyplaceUpdateAPIDataProvider: MyPlaceEditDataProvider{
    
    private var apiRequest:EditApiRequest<placeEditApiResource>?
    
    func updateMyPlace(_ myplace: MyplacesListItem, completionHandler: @escaping (String?, Error?) -> ()) {
        
        let resource = placeEditApiResource(myplace: myplace)
        let request = EditApiRequest(resource: resource)
        apiRequest = request
        request.update { (result, error) in
            completionHandler(result,error)
        }
    }
}

