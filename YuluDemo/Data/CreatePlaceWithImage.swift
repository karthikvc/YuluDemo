//
//  CreatePlaceWithImage.swift
//  YuluDemo
//
//  Created by Admin on 11/4/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

struct CreateplaceWithImageApiResource: CreatePlaceAPIResource {
    
    typealias Model = MyPlacesJson
    var myplace: MyplacesListItem
    
    var methodPath: String {
        return "/v1/places"
    }
    
    var methodType: String{
        return "POST"
    }
    
    var latitude: String{
        return "\(myplace.latitude)"
    }
    
    var longtitude: String {
        return "\(myplace.longitude)"
    }
    
    var description: String {
        return myplace.description
    }
    
    var imageFile:String
    
    var titleName: String{
        return myplace.title
    }
   

}


class CreatePlaceWithImageAPIDataProvider: UploadImageDataProvider {
    
    private var apiRequest:EditApiRequest<CreateplaceWithImageApiResource>?
    
    func uploadImage(_ myplace: MyplacesListItem, imageFile: String, completionHandler: @escaping (String?, Error?) -> ()) {
        
        let resource = CreateplaceWithImageApiResource(myplace: myplace, imageFile: imageFile)
        let request = EditApiRequest(resource: resource)
        
        apiRequest = request
        request.update { (result, error) in
            completionHandler(result,error)
        }
    }
    

}
