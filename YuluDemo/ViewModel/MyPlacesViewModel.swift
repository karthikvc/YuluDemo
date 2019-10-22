//
//  MyPlacesViewModel.swift
//  YuluDemo
//
//  Created by Admin on 10/19/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit

protocol MyplacesListViewModelCoordinatorDelegate: class {
    
    func MyplacesViewModelDidSelect(myplace: MyplacesListItem)
}



public class MyPlacesViewModel {
    
    private var myPlaces: [MyplacesListItem] = []
    
    private let dataProvider:MyPlacesListDataProvider // Data provider to fetch search results
    weak var coordinateDelegate: MyplacesListViewModelCoordinatorDelegate?
    
    // Callback closures
    public var reloadList:(()->())?
    
    public init(dataProvider:MyPlacesListDataProvider) {
       self.dataProvider = dataProvider
        NotificationCenter.default.addObserver(self, selector: #selector(self.batteryLevelChanged), name:NSNotification.Name(rawValue: "UpdatePlace"), object: nil)
    }
    
    func setCoordinator(coordinater: MyplacesListViewModelCoordinatorDelegate){
        self.coordinateDelegate = coordinater
    }
}

extension MyPlacesViewModel {
    
    public func loadMyPlaces() {
        
        self.fetchMyPlaces("test") {[weak self](error) in
            guard let strongSelf = self else {return}
            
            strongSelf.reloadList?()
            
            DispatchQueue.global().async {
                
                
                for placeIndex in 0...self!.myPlaces.count-1 {
                    
                    strongSelf.fetchMyPlaceFor(( (self?.myPlaces[placeIndex].placeId)!), handler: {[weak self,placeIndex] (fetchplace, error) in
                       
                       self?.myPlaces[placeIndex] = fetchplace!
                    })
                    
                }
                
            }
            
        }
    }
    
    @objc private func batteryLevelChanged(notification: NSNotification){
        //do stuff using the userInfo property of the notification object
        print("updating")
        
        self.loadMyPlaces()
        
    }
    
}

extension MyPlacesViewModel {
    
    public func numberofItems() -> Int {
    
       return myPlaces.count
    }
    
    public func myPlacesListItem(at indexPath: IndexPath)-> MyplacesListItem?  {
        
        return myPlaces[indexPath.row]
    }
    
    public func myplaceDidSelecte(at indexpath: IndexPath) {
        let myplace = myPlaces[indexpath.row]
        if let coordiantor = coordinateDelegate {
            coordiantor.MyplacesViewModelDidSelect(myplace: myplace)
        }
        else {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let appcoordinator  = appDelegate.appCoordinator
            coordinateDelegate = appcoordinator?.coordinators[0] as? MyplacesListViewModelCoordinatorDelegate
            coordinateDelegate!.MyplacesViewModelDidSelect(myplace: myplace)
        }
    }
    
}


extension MyPlacesViewModel{
    
    private func fetchMyPlaces(_ query:String, handler:((Error?)->())?) {
        
        self.dataProvider.fetchMyPlacesListFor(query) {[weak self] (myplaceList, error) in
            
            guard let storngSelf = self else { return }
            
            guard let list = myplaceList, list.result.count > 0 else { handler?(error)
                return}
            
            storngSelf.myPlaces = list.result
            handler?(error)
            print(myplaceList as Any)
        }
    }
    
    
    private func fetchMyPlaceFor(_ placeId: String, handler:@escaping (MyplacesListItem?, Error?)->()) {
        
        self.dataProvider.fetchMyPlaceFor(placeId) {(myplace ,error) in
            
            handler(myplace,error)
        }
        
    }
}
