//
//  AddMyPlaceViewModel.swift
//  YuluDemo
//
//  Created by Admin on 10/22/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit

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

    public func getCoordinate()-> String {
        let longitude = String(format:"%.2f", self.myPlace.longitude)
        let latitude = String(format:"%.2f", self.myPlace.latitude)
        return latitude + "," + longitude
    }
    
    public func updateTitle(title: String){
        
        self.myPlace.title = title
    }
    
    public func updateDescritption(description: String){
        self.myPlace.description = description
    }
    
    public func addCoordiante(longtitude: Double, latitue: Double) {
        self.myPlace.latitude = latitue
        self.myPlace.longitude = longtitude
    }
    
    public func mapViewLoad(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let appcoordinator  = appDelegate.appCoordinator
        let coordinateDelegate = appcoordinator?.coordinators[0] as? MapViewModelCoordinatorDelegate
        coordinateDelegate!.mapViewLoad(desinationModel: self)
    
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
