//
//  AddMyplaceViewController.swift
//  YuluDemo
//
//  Created by Admin on 10/22/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class AddMyplaceViewController: UIViewController, StoryboardIdentifiable {

    private var viewModel:AddMyPlaceViewModel! // ViewModel
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var subTitleTextField: UITextView!
    
    @IBOutlet weak var CoordinatorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViewModel()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.CoordinatorButton.setTitle(self.viewModel.getCoordinate(), for: .normal)
        
    }
    
    class func controller(viewModel: AddMyPlaceViewModel) -> AddMyplaceViewController {
        let vc:AddMyplaceViewController = UIStoryboard (storyboard: .main).instantiateViewController()
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
    
    @IBAction func done(_ sender: UITextField) {
        
        sender.resignFirstResponder()
    }
    
    @IBAction func SaveMyNewplace(_ sender: Any) {
        
       self.viewModel.updateTitle(title: titleTextField.text!)
        self.viewModel.addNewPlace()
    }
    
    @IBAction func LoadMapView(_ sender: Any) {
        
        self.viewModel.mapViewLoad()
        
    }
    
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


extension AddMyplaceViewController: UITextViewDelegate {
    public func textViewDidChange(_ textView: UITextView) {
        if textView.text.last == "\n" { //Check if last char is newline
            textView.text.removeLast() //Remove newline
            textView.resignFirstResponder() //Dismiss keyboard
        }
    }
}
