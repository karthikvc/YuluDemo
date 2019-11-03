//
//  AddMyPlaceAPIDataProvider.swift
//  YuluDemo
//
//  Created by Admin on 10/22/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation


struct addMyplaceApiResource: AddApiResource {
    var myplace: MyplacesListItem
    
    typealias Model = MyPlacesJson
    
    var methodPath: String {
        return "/v1/places"
    }
    
    var methodType: String {
        return "POST"
    }
}

class AddMyplaceAPIDataProvider: AddMyPlaceDataProvider {
    
    private var apiRequest:EditApiRequest<addMyplaceApiResource>?
    
    func addMyPlace(_ myplace: MyplacesListItem, completionHandler: @escaping (String?, Error?) -> ()) {
        
        let resource = addMyplaceApiResource(myplace: myplace)
        let request = EditApiRequest(resource: resource)
        apiRequest = request
        request.update { (result, error) in
            completionHandler(result,error)
        }
        
    }
    
}
