//
//  MapViewCoordinator.swift
//  YuluDemo
//
//  Created by Admin on 10/22/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit

class MapViewCoordinator:Coordinator {
    
    let navigationController:UINavigationController!
    let desinationViewmodel: AddMyPlaceViewModel
    init(withNavigationController navigationController:UINavigationController, desinationModel:AddMyPlaceViewModel) {
        self.navigationController = navigationController
        self.desinationViewmodel = desinationModel
    }
    
    
    func start() {
        let vm =  MapViewModel(viewModel: desinationViewmodel)
        let viewController = MapViewController.controller(viewModel: vm)
        self.navigationController .pushViewController(viewController, animated: true)
    }
}
