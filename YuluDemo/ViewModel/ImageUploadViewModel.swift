//
//  ImageUploadView.swift
//  YuluDemo
//
//  Created by Admin on 10/25/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation


public class ImageupLoadViewModel {
    var desinationViewModel : MyPlaceDetailViewModel!
    var dataProvider : ImageUploadAPIDataProvider!
    public var showAlert:((String?)->())?
    
    init(viewModel: MyPlaceDetailViewModel) {
        
        self.desinationViewModel = viewModel
        self.dataProvider = ImageUploadAPIDataProvider()
    }
    
    
    func uploadImageBy(file: String){
        
        self.updateImageeBy(self.desinationViewModel.getPlaceItem(), file: file) { (result, error) in
            
             self.showAlert?(result)
            
            if result == "Success" {
                NotificationCenter.default.post(name: NSNotification.Name("UpdatePlace"), object: nil, userInfo: nil)
            }
        }
        
    }

}


extension ImageupLoadViewModel {
    
    private func updateImageeBy(_ place: MyplacesListItem, file: String,  handler:@escaping (String?, Error?)->()) {
        self.dataProvider.uploadImage(place , imageFile: file) {  (result, error) in
            
                 handler(result,error)
            }
        
        }
    }
    

