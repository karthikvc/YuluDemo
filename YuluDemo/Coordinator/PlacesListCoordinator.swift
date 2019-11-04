//
//  PlacesListCoordinator.swift
//  YuluDemo
//
//  Created by Admin on 10/20/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit

class MyPlacesListCoordinator:Coordinator {
    
    let navigationController:UINavigationController!
    var viewController: MyPlacesViewController?
    
    init(withNavigationController navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        
        let vm = MyPlacesViewModel(dataProvider: MyPlacesAPIDataProvider())
        vm.coordinateDelegate = self
        viewController = MyPlacesViewController.controller(viewModel: vm)
        self.navigationController .pushViewController(viewController!, animated: true)
        
    }
}

extension MyPlacesListCoordinator :MyplacesListViewModelCoordinatorDelegate {
    
    func MyplacesViewModelDidSelect(myplace: MyplacesListItem) {
   
        let detailViewCoordinator = MyPlaceDetailViewCoordinator(withNavigationController:
            self.navigationController, myplace: myplace)
        
        
          detailViewCoordinator.start()
        
    }
    
}


extension MyPlacesListCoordinator :MyplacesDetailViewModelCoordinatorDelegate {
    
    func MyplaceEditViewModel(myplace: MyplacesListItem) {
        
        let editViewCoordinator = MyPlaceEditViewCoordinator(withNavigationController: self.navigationController, myplace: myplace)
        editViewCoordinator.start()
        
    }
    
    func MyplaceImageUploadviewModel(myplaceDetailviewModel: ImageLoadModelViewProtocal){
       let imageuploadCoordinator = ImageuploadCoordinate(withNavigationController: self.navigationController, desinationModel: myplaceDetailviewModel)
        
        imageuploadCoordinator.start()
    }
    
}

extension MyPlacesListCoordinator: AddMyplacesViewModelCoordinatorDelegate {
    func addMyplaceViewLoad() {
        
        let addViewCoordinator = AddPlaceViewCoordinator(withNavigationController: self.navigationController)
        addViewCoordinator.start()
        
    }
}

extension MyPlacesListCoordinator: MapViewModelCoordinatorDelegate {
    
    func mapViewLoad(desinationModel: MapViewModelProtocal) {
        let mapViewCoordinator = MapViewCoordinator(withNavigationController: self.navigationController,desinationModel: desinationModel)
        mapViewCoordinator.start()
        
    }
    
}
