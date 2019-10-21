//
//  UIViewControllerExten.swift
//  YuluDemo
//
//  Created by Admin on 10/20/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit

// Protocol to prevent hard-coding storyboard ids for view controllers
protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
