//
//  MyPlaceEditViewController.swift
//  YuluDemo
//
//  Created by Admin on 10/21/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class MyPlaceEditViewController: UIViewController,StoryboardIdentifiable {

    @IBOutlet weak var TitleTextField: UITextField!
    @IBOutlet weak var subTitleTextField: UITextView!
    
    @IBOutlet weak var CoordinatorButton: UIButton!
    
    private var viewModel:MyPlaceEditViewModel! // ViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewModel()
        // Do any additional setup after loading the view.
    }
    
    class func controller(viewModel: MyPlaceEditViewModel) -> MyPlaceEditViewController {
        let vc:MyPlaceEditViewController = UIStoryboard (storyboard: .main).instantiateViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    private func setUpViewModel() {
        
        viewModel.showAlert = { [weak self](message) in
            if let result = message {
                self?.showAlert(message: result)
            }
            
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
     
        self.TitleTextField.text = self.viewModel.getTitle()
        self.subTitleTextField.text = self.viewModel.getDescription()
        self.CoordinatorButton.setTitle(self.viewModel.getCoordinate(), for: .normal)
        
    }
    
    @IBAction func updateCoordinateAction(_ sender: Any) {
        
        //self.showAlert()
        
        self.viewModel.mapViewLoad()
        
    }
    
    @IBAction func SaveEditMyplace(_ sender: Any) {
        
        self.viewModel.updateTitle(title: TitleTextField.text!)
        self.viewModel.updateMyPlace()
    }
    
//    func showAlert(message: String){
//
//        let alert = UIAlertController(title: "Result", message: message, preferredStyle: .alert)
//
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
//
//            if message != "Fail" {
//                self.navigationController?.popViewController(animated: true)
//            }
//
//        }))
//
//        self.present(alert, animated: true, completion: nil)
//
//    }
    
}
