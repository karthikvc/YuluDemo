//
//  MyplaceEditViewModel.swift
//  YuluDemo
//
//  Created by Admin on 10/21/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation


public class MyPlaceEditViewModel {
    private let dataProvider:MyplaceUpdateAPIDataProvider
    private var myPlace: MyplacesListItem?
    public var showAlert:((String?)->())?
    
    init(myplace: MyplacesListItem, dataProvider: MyplaceUpdateAPIDataProvider) {
        self.myPlace = myplace
        self.dataProvider = dataProvider
    }
    
}


extension MyPlaceEditViewModel {
    
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
    
    public func updateTitle(title: String){
        
        self.myPlace?.title = title
    }
    
    public func updateDescritption(description: String){
        self.myPlace?.description = description
    }
    
    public func updateCoordiante(longtitude: Double, latitue: Double) {
        
    }
    
    public func updateMyPlace() {
        self.updateMyplaceBy(myPlace!) { (result, error ) in
            
            self.showAlert?(result)
            
            if result == "Success" {
                NotificationCenter.default.post(name: NSNotification.Name("UpdatePlace"), object: self.myPlace, userInfo: ["modelItem":self.myPlace!])
            }
        }
    }
}

extension MyPlaceEditViewModel {
    
    private func updateMyplaceBy(_ place: MyplacesListItem, handler:@escaping (String?, Error?)->()) {
        self.dataProvider.updateMyPlace(place){ (result, error) in
         
            handler(result,error)
        }
    }
    
}
