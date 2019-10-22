//
//  MyPlaceEditViewCoordinator.swift
//  YuluDemo
//
//  Created by Admin on 10/21/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit


class MyPlaceEditViewCoordinator:Coordinator {
    
    let navigationController:UINavigationController!
    let myplace : MyplacesListItem!
    init(withNavigationController navigationController:UINavigationController, myplace: MyplacesListItem) {
        self.navigationController = navigationController
        self.myplace = myplace
    }
    
    
    func start() {
        let vm =  MyPlaceEditViewModel(myplace: self.myplace, dataProvider: MyplaceUpdateAPIDataProvider())
        let viewController = MyPlaceEditViewController.controller(viewModel: vm)
        self.navigationController .pushViewController(viewController, animated: true)
    }
}
