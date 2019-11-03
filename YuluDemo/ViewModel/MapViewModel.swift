//
//  MapViewModel.swift
//  YuluDemo
//
//  Created by Admin on 10/22/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

protocol MapViewModelCoordinatorDelegate: class {
    
    func mapViewLoad(desinationModel: MapViewModelProtocal)
}


public class MapViewModel {
    var desinationViewModel : MapViewModelProtocal!
    init(viewModel: MapViewModelProtocal) {
        
        self.desinationViewModel = viewModel
    }
    
    
    func addLocation(latitude:Double, longitude: Double){
        self.desinationViewModel.addCoordiante(longtitude: longitude, latitue: latitude)
    }
    
    func getlatitute()-> Double {
        
        return self.desinationViewModel.getlatitute()
    }
    
    func getlongtitute()-> Double {
        
        return self.desinationViewModel.getlongtite()
    }
    
    func numberofLocation() -> Int {
        
        return self.desinationViewModel.getNumberOfLocation()
    }
    
    func getPlaceItem(index: Int) -> MyplacesListItem{
        
        return self.desinationViewModel.getPlaceItem(index: index)
    }
    
    func isEditMode()-> Bool {
        return self.desinationViewModel.isEditMode()
    }
    
}
