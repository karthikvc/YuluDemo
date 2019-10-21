//
//  MyplaceEditViewModel.swift
//  YuluDemo
//
//  Created by Admin on 10/21/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation


public class MyPlaceEditViewModel {
    
    private var myPlace: MyplacesListItem?
    
    init(myplace: MyplacesListItem) {
        self.myPlace = myplace
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
}
