//
//  AddMyPlaceViewModel.swift
//  YuluDemo
//
//  Created by Admin on 10/22/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

protocol AddMyplacesViewModelCoordinatorDelegate: class {
    
    func addMyplaceViewLoad()
}



public class AddMyPlaceViewModel {
    private let dataProvider:AddMyplaceAPIDataProvider
    var myPlace = MyplacesListItemModel()
    
    public var showAlert:((String?)->())?
    
    init(dataProvider: AddMyplaceAPIDataProvider) {
       self.dataProvider = dataProvider
    }
    
}

extension AddMyPlaceViewModel {

    
    
    public func updateTitle(title: String){
        
        self.myPlace.title = title
    }
    
    public func updateDescritption(description: String){
        self.myPlace.description = description
    }
    
    public func updateCoordiante(longtitude: Double, latitue: Double) {
        
    }
    
    func addNewPlace(){
        
        self.addMyplaceBy(myPlace) { (result, error) in
            
            self.showAlert?(result)
            if result == "Success" {
                NotificationCenter.default.post(name: NSNotification.Name("UpdatePlace"), object: nil, userInfo: nil)
            }
        }
        
    }
}


extension AddMyPlaceViewModel {
    
    private func addMyplaceBy(_ place: MyplacesListItem, handler:@escaping (String?, Error?)->()) {
        self.dataProvider.addMyPlace(place){ (result, error) in
            
            handler(result,error)
        }
    }
    
}
