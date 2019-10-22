//
//  MyplacesListDataProvider.swift
//  YuluDemo
//
//  Created by Admin on 10/19/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

public protocol MyplacesListItem {
    var placeId: String { get  set }
    var title: String { get set }
    var latitude: Double { get }
    var longitude: Double { get }
    var imageUrlPath: String? { get }
    var description: String { get set }
    
}

public protocol MyPlacesList {
    var result:[MyplacesListItem] {get}
}

public protocol MyPlacesListDataProvider {
    func fetchMyPlacesListFor(_ query:String, completionHandler: @escaping(MyPlacesList?, Error?)->())
    func fetchMyPlaceFor(_ placeId:String, completionHandler: @escaping(MyplacesListItem?, Error?)->())
    func cancelTask()
}

public protocol MyPlaceEditDataProvider {
    
    func updateMyPlace(_ myplace: MyplacesListItem, completionHandler: @escaping(String?,Error?)->())
}


public struct MyPlacesListModel:MyPlacesList {
    public var result: [MyplacesListItem]
    
    init(json: [MyPlacesJson]) {
        
        result = json.map { MyplacesListItemModel( json: $0) }
    }
    
}

public struct MyplacesListItemModel: MyplacesListItem{
    
    public var title: String
    public var placeId: String
    public var latitude: Double
    public var longitude: Double
    public var imageUrlPath: String?
    public var description: String
    
    init(json : MyPlacesJson ) {
        
        title = json.title!
        placeId = json.id!
        latitude = json.latitude!
        longitude = json.longitude!
        description = ""
        imageUrlPath = ""
        if let descrip = json.description {
            self.description = descrip
        }
        
        if let imgUrl = json.imageUrl {
            self.imageUrlPath  = imgUrl
        }
        
    }
}
