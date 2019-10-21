//
//  MyPlaceDetailViewModel.swift
//  YuluDemo
//
//  Created by Admin on 10/21/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit

protocol MyplacesDetailViewModelCoordinatorDelegate: class {
    
    func MyplaceEditViewModel(myplace: MyplacesListItem)
}

public class MyPlaceDetailViewModel {
    
    private var myPlace: MyplacesListItem?
    
    init(myplace: MyplacesListItem) {
        self.myPlace = myplace
    }
    
}

extension MyPlaceDetailViewModel {
    
    public func getTitle()-> String {
        return self.myPlace!.title
    }
    
    public func getDescription() -> String {
        return self.myPlace!.description
    }
    
    public func getCoordinate()-> String {
        let longitude = String(format:"%.2f", self.myPlace!.longitude)
        let latitude = String(format:"%.2f", self.myPlace!.latitude)
        return latitude + "," + longitude
    }
    
    
    public func getImageUrl()-> URL? {
        
        var url = ""
        
        if let imageurl = self.myPlace?.imageUrlPath {
             url += imageurl
           // http://35.154.73.71/api/v1/image/4kVUZGJMUXS4S1mG
            let baseUrl = "http://35.154.73.71/api/v1"
            let components = URLComponents(string: baseUrl + imageurl)!
            return components.url!
        }
        
        return URL(fileURLWithPath: url)
        
    }
    
    
    func loadMyPlaceEditViewController() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let appcoordinator  = appDelegate.appCoordinator
        let coordinateDelegate = appcoordinator?.coordinators[0] as? MyplacesDetailViewModelCoordinatorDelegate
        coordinateDelegate!.MyplaceEditViewModel(myplace: myPlace!)
    }
    
}
