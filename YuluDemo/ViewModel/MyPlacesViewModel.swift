//
//  MyPlacesViewModel.swift
//  YuluDemo
//
//  Created by Admin on 10/19/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation


public class MyPlacesViewModel {
    
    private var myPlaces: [MyplacesListItem] = []
    
    private let dataProvider:MyPlacesListDataProvider // Data provider to fetch search results
    
    // Callback closures
    public var reloadList:(()->())?
    
     public init(dataProvider:MyPlacesListDataProvider) {
       self.dataProvider = dataProvider
    }
    
}

extension MyPlacesViewModel {
    
    public func loadMyPlaces() {
        
        self.fetchMyPlaces("test") {[weak self](error) in
            guard let strongSelf = self else {return}
            
            strongSelf.reloadList?()
            
            strongSelf.fetchMyPlaceFor((self?.myPlaces[0].placeId)!, handler: { (error) in
                
            })
        }
    }
    
}

extension MyPlacesViewModel {
    
    public func numberofItems() -> Int {
    
       return myPlaces.count
    }
    
    public func myPlacesListItem(at indexPath: IndexPath)-> MyplacesListItem?  {
        
        return myPlaces[indexPath.row]
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
    
    private func fetchMyPlaceFor(_ placeId: String, handler:((Error?)->())?) {
        
        self.dataProvider.fetchMyPlaceFor(placeId) {[weak self] (myplace ,error) in
            
            // guard let storngSelf = self else { return }
            
            print(myplace )
        }
        
    }
}
