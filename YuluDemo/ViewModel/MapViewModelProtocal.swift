//
//  MapViewModelProtocal.swift
//  YuluDemo
//
//  Created by Admin on 11/1/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation


protocol MapViewModelProtocal {
    func addCoordiante(longtitude: Double, latitue: Double)
    func getlatitute()-> Double
    func getlongtite()-> Double
    func isEditMode()-> Bool
    func getNumberOfLocation()-> Int
    func getPlaceItem(index: Int) -> MyplacesListItem
}

extension MapViewModelProtocal {
    func addCoordiante(longtitude: Double, latitue: Double) {
        
    }
    
    func getlatitute() -> Double {
        return 0.0
    }
    
    func getlongtite() -> Double {
        return 0.0
    }
    
    func isEditMode()-> Bool {
        return false
    }
    
    func getNumberOfLocation()-> Int {
        return 0
    }
    
    func getPlaceItem(index: Int) -> MyplacesListItem {
        
        return MyplacesListItemModel()
    }
}
