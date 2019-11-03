//
//  DetailViewCoordinator.swift
//  YuluDemo
//
//  Created by Admin on 10/20/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit

class MyPlaceDetailViewCoordinator:Coordinator {
    
    let navigationController:UINavigationController!
    let myplace : MyplacesListItem!
    init(withNavigationController navigationController:UINavigationController, myplace: MyplacesListItem) {
        self.navigationController = navigationController
        self.myplace = myplace
    }


    func start() {
        let vm = MyPlaceDetailViewModel(myplace: self.myplace)
        vm.setDataProvider(dataProvider: MyPlacesAPIDataProvider())
        let viewController = MyPlaceDetailViewController.controller(viewModel: vm)
        
        self.navigationController .pushViewController(viewController, animated: true)
    }
}
