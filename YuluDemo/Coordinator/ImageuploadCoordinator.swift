//
//  ImageuploadCoordinator.swift
//  YuluDemo
//
//  Created by Admin on 10/25/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit

class ImageuploadCoordinate: Coordinator{
    
    let navigationController:UINavigationController!
    let desinationViewmodel: ImageLoadModelViewProtocal
    init(withNavigationController navigationController:UINavigationController, desinationModel:ImageLoadModelViewProtocal) {
        self.navigationController = navigationController
        self.desinationViewmodel = desinationModel
    }
    
    
    func start() {
        let vm =  ImageupLoadViewModel(viewModel: desinationViewmodel)
        let viewController = ImageuploadViewController.controller(viewModel: vm)
        self.navigationController .pushViewController(viewController, animated: true)
    }
}
