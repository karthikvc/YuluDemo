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


extension UIViewController {
    
    func showAlert(message: String){
        
        let alert = UIAlertController(title: "Result", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            
            if message != "Fail" {
                self.navigationController?.popViewController(animated: true)
            }
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
