//
//  MyPlacesViewModel.swift
//  YuluDemo
//
//  Created by Admin on 10/19/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation


public class MyPlacesViewModel {
    
    private var title:String = ""
    
    private let dataProvider:MyPlacesListDataProvider // Data provider to fetch search results
    
     public init(dataProvider:MyPlacesListDataProvider) {
       self.dataProvider = dataProvider
    }
    
}

extension MyPlacesViewModel {
    
    public func loadMyPlaces() {
        
        self.fetchMyPlaces("test")
    }
    
}


extension MyPlacesViewModel{
    
   private func fetchMyPlaces(_ query:String) {
        
        self.dataProvider.fetchMyPlacesListFor(query) { (myplaceList, error) in
            
            print(myplaceList as Any)
        }
    }
}
