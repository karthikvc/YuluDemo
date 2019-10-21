//
//  AppCoordinator.swift
//  YuluDemo
//
//  Created by Admin on 10/20/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    func start()
}


class AppCoordinator:Coordinator {
    
    let navigationController:UINavigationController!
    var coordinators:[Coordinator] = []
    
    public init(withNavigationController navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let myplacesListCoordinator = MyPlacesListCoordinator(withNavigationController: self.navigationController)
        myplacesListCoordinator.start()
        coordinators.append(myplacesListCoordinator)
    }
}
