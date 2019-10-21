//
//  MyPlaceDetailViewController.swift
//  YuluDemo
//
//  Created by Admin on 10/20/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import SDWebImage

class MyPlaceDetailViewController: UIViewController,StoryboardIdentifiable {
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet var placetitle: UILabel!
    @IBOutlet weak var placedescription: UILabel!
    @IBOutlet weak var placeCoordinate: UITextField!
    @IBOutlet weak var PlaceDetail: UITextView!
    
    private var viewModel:MyPlaceDetailViewModel! // ViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    class func controller(viewModel: MyPlaceDetailViewModel) -> MyPlaceDetailViewController {
        let vc:MyPlaceDetailViewController = UIStoryboard (storyboard: .main).instantiateViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.placetitle.text = self.viewModel.getTitle()
        self.placedescription.text = self.viewModel.getDescription()
        self.placeCoordinate.text = self.viewModel.getCoordinate()
        
        let imageurl = self.viewModel.getImageUrl()
        print(imageurl as Any)
        self.ImageView.sd_setImage(with: imageurl, completed: nil)
    }

 
    @IBAction func editButtonAction(_ sender: Any) {
        print("button Presso")
        self.viewModel.loadMyPlaceEditViewController()
    }
    
}

