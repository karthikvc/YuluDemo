//
//  AddMyPlaceViewCoordintor.swift
//  YuluDemo
//
//  Created by Admin on 10/22/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit

class AddPlaceViewCoordinator:Coordinator {
    
    let navigationController:UINavigationController!
    
    init(withNavigationController navigationController:UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    
    func start() {
        let vm =  AddMyPlaceViewModel(dataProvider: AddMyplaceAPIDataProvider())
        let viewController = AddMyplaceViewController.controller(viewModel: vm)
        self.navigationController .pushViewController(viewController, animated: true)
    }
}
