//
//  MapViewModel.swift
//  YuluDemo
//
//  Created by Admin on 10/22/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

protocol MapViewModelCoordinatorDelegate: class {
    
    func mapViewLoad(desinationModel: AddMyPlaceViewModel)
}


public class MapViewModel {
    var desinationViewModel : AddMyPlaceViewModel!
    init(viewModel: AddMyPlaceViewModel) {
        
        self.desinationViewModel = viewModel
    }
    
    
    func addLocation(latitude:Double, longitude: Double){
        self.desinationViewModel.addCoordiante(longtitude: longitude, latitue: latitude)
    }
    
}
