//
//  ImageuploadDataProvider.swift
//  YuluDemo
//
//  Created by Admin on 10/26/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation


struct ImageuploadApiResource: ImageUploadAPIResource {
 
    var myplace: MyplacesListItem
    
    typealias Model = MyPlacesJson
    
    var methodPath: String {
        return "/v1/places/\(myplace.placeId)"
    }
    
    var methodType: String {
        return "PUT"
    }
    
    var imageFile:String
    
    var titleName: String {
        return myplace.title
    }
}

class ImageUploadAPIDataProvider: UploadImageDataProvider {
    
    private var apiRequest:EditApiRequest<ImageuploadApiResource>?
    
    func uploadImage(_ myplace: MyplacesListItem, imageFile: String, completionHandler: @escaping (String?, Error?) -> ()) {
        
        let resource = ImageuploadApiResource(myplace: myplace, imageFile: imageFile)
        let request = EditApiRequest(resource: resource)
        apiRequest = request
        request.update { (result, error) in
            completionHandler(result,error)
        }
        
    }
    
}
