//
//  CreatePlaceWithImage.swift
//  YuluDemo
//
//  Created by Admin on 11/4/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation


protocol CreatePlaceAPIResource: ImageUploadAPIResource {
    
     var latitude:String { get }
     var longtitude:String { get }
     var description:String { get }
}


extension CreatePlaceAPIResource {
    
    var parameters: [String: String] {
        return [
            "title": titleName,
            "latitude": latitude,
            "longitude": longtitude,
            "description": description
         ]
    }

    var urlRequest: URLRequest {
        
        var urlrequest = URLRequest(url: self.url)
        
        let media = Media(withImage: imageFile, fileName: "test.jpg")!
        let boundary = "----WebKitFormBoundary7MA4YWxkTrZu0gW"
        
        let body = createDataBody(withParameters: parameters, media: [media], boundary: boundary)
        
        urlrequest.allHTTPHeaderFields = headers
        urlrequest.httpBody = body
        urlrequest.httpMethod = methodType
        
        return urlrequest
    }
    
}
