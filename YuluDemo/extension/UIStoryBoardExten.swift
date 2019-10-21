//
//  UIStoryBoardExten.swift
//  YuluDemo
//
//  Created by Admin on 10/20/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    // Enum for preventing hard coded storyboard names
    enum Storyboard: String {
        case main
        var filename: String {
            return rawValue.capitalized
        }
    }
    
    // Convenience init to create storyboard from Storyboard enum
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }
    
    // Class func to create storyboard from Storyboard enum
    class func storyboard(storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(storyboard:storyboard, bundle:bundle)
    }
    
    // Instantiating ViewControllers from storyboard using StoryboardIdentifiable protocol
    func instantiateViewController<T: UIViewController>() -> T where T: StoryboardIdentifiable {
        
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        
        return viewController
    }
}
