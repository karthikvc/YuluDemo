//
//  MyPlaceAPIDataProvider.swift
//  YuluDemo
//
//  Created by Admin on 10/20/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

struct MyPlaceResources: APIResource {
    
    typealias Model = MyPlacesJson
    
    var methodPath: String {
        return "/v1/places/" + placeId
    }
    
    var placeId: String
    
    var queryItems: String {
        return " "
    }
    
    func decodeData(data: Data) -> [MyPlacesJson]? {
        
        let decoder = JSONDecoder()
        do {
            let jsondata = try decoder.decode(Model.self, from: data)
            return  [jsondata]  //try decoder.decode(Model.self, from: data)
        }
        catch {
            print(error)
            return nil
        }
        
    }
    
    
}

extension MyPlacesAPIDataProvider{
    
    //private var apiRequest: APIRequest<MyPlacesResources>?
    
    func fetchMyPlaceFor(_ PlaceId: String, completionHandler: @escaping (MyplacesListItem?, Error?) -> ()) {
        
        let resource = MyPlaceResources(placeId: PlaceId)
        print(resource.methodPath)
        let request = APIRequest(resource: resource)
        
        request.load { (json,error) in
            
            guard let item = json else { completionHandler (nil,error)
                return
            }
            
            let placeItem = MyplacesListItemModel( json: item[0])
             completionHandler(placeItem,error)
            
        }
    }
   
   
}
