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


public class AddMyPlaceViewModel: MapViewModelProtocal {
    private let dataProvider:AddMyplaceAPIDataProvider
    private var createPlaceDataProvider: CreatePlaceWithImageAPIDataProvider? = CreatePlaceWithImageAPIDataProvider()
    var myPlace = MyplacesListItemModel()
    var imageFile: String?
    public var showAlert:((String?)->())?
    
    init(dataProvider: AddMyplaceAPIDataProvider) {
       self.dataProvider = dataProvider
    }
    
    func setCreatePlaceApiDataProvider(dataProvider: CreatePlaceWithImageAPIDataProvider) {
        self.createPlaceDataProvider = dataProvider
    }
    
}

extension AddMyPlaceViewModel:ImageLoadModelViewProtocal {
    var ImageFile: String? {
        get {
            return imageFile
        }
        set {
            imageFile = newValue
        }
    }
    
    var IsEditMode: Bool {
        return false
    }
    
    func getPlaceItem() -> MyplacesListItem {
        return myPlace
    }
    

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
    
    func isEditMode() -> Bool {
        return true
    }
    
    public func addCoordiante(longtitude: Double, latitue: Double) {
        self.myPlace.latitude = latitue
        self.myPlace.longitude = longtitude
    }
    
    public func getlatitute() -> Double {
        return myPlace.latitude
    }
    
    public func getlongtite() -> Double {
        return myPlace.longitude
    }
    
    public func mapViewLoad(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let appcoordinator  = appDelegate.appCoordinator
        let coordinateDelegate = appcoordinator?.coordinators[0] as? MapViewModelCoordinatorDelegate
        coordinateDelegate!.mapViewLoad(desinationModel: self)
    
    }
    
    func loadMyplaceImageuploadViewcontroller() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let appcoordinator  = appDelegate.appCoordinator
        let coordinateDelegate = appcoordinator?.coordinators[0] as? MyplacesDetailViewModelCoordinatorDelegate
        
        coordinateDelegate?.MyplaceImageUploadviewModel(myplaceDetailviewModel: self)
    }
    
    
    
    func addNewPlace(){
        
        if self.ImageFile != nil {
            
            self.createPlaceWithImage()
        }
        else {
            self.createPlace()
        }
        
    }
    
    func createPlace(){
        
        self.addMyplaceBy(myPlace) { (result, error) in
            
            self.showAlert?(result)
            if result == "Success" {
                NotificationCenter.default.post(name: NSNotification.Name("UpdatePlace"), object: nil, userInfo: nil)
            }
        }
        
    }
    
    func createPlaceWithImage(){
        
        self.createPlaceBy(WithImage: myPlace, image: ImageFile!) { (result, error) in
            
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
    
    private func createPlaceBy(WithImage place: MyplacesListItem, image: String, handler:@escaping (String?, Error?)->()) {
        self.createPlaceDataProvider?.uploadImage(place, imageFile: image, completionHandler: handler)
    }
    
    
}
