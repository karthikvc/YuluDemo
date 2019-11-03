//
//  ImageuploadViewController.swift
//  YuluDemo
//
//  Created by Admin on 10/25/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ImageuploadViewController: UIViewController,StoryboardIdentifiable,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var chooseBuuton: UIButton!
    var imagePicker = UIImagePickerController()
    var viewModel:ImageupLoadViewModel?
    var imageFile: NSString?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpViewModel()
    }
    
    private func setUpViewModel() {
        
        viewModel?.showAlert = { [weak self](message) in
            if let result = message {
                self?.showAlert(message: result)
            }
            
        }
    }
    
    @IBAction func btnClicked() {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
           print(info[.imageURL]!)
           imageView.image = info[.originalImage]! as? UIImage
        let url = info[.imageURL]! as! NSURL
        self.imageFile  = url.path as NSString?
           picker.dismiss(animated: true, completion: nil)
        
        }
    
    class func controller(viewModel: ImageupLoadViewModel) -> ImageuploadViewController {
        let vc:ImageuploadViewController = UIStoryboard (storyboard: .main).instantiateViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    
    @IBAction func imageUoloadAction(_ sender: Any) {
        
        self.viewModel?.uploadImageBy(file: imageFile! as String)
        //self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    func checkPermission() {
//        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
//        switch photoAuthorizationStatus {
//        case .authorized: print("Access is granted by user")
//        case .notDetermined:
//            PHPhotoLibrary.requestAuthorization({ (newStatus) in print("status is \(newStatus)") if newStatus == PHAuthorizationStatus.authorized { /do stuff here */ print("success") } })
//                case .restricted: / print("User do not have access to photo album.")
//                case .denied: / print("User has denied the permission.")
//
//                }
//
            }

}
