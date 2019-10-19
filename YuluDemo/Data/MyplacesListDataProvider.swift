//
//  MyplacesListDataProvider.swift
//  YuluDemo
//
//  Created by Admin on 10/19/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

public protocol MyplacesListItem {
    
    var title: String { get }
    var imageUrlPath: String? { get }
    var Description: String { get }
    
}

public protocol MyPlacesList {
    var result:[MyplacesListItem] {get}
}

public protocol MyPlacesListDataProvider {
    func fetchMovieListFor(_ query:String, completionHandler: @escaping(MyPlacesList?, Error?)->())
    func cancelTask()
}

public struct MyplacesListItemModel: MyplacesListItem{
    
    public let title: String
    public let imageUrlPath: String?
    public let Description: String
    
}
