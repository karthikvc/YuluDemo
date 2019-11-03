//
//  Media.swift
//  YuluDemo
//
//  Created by Admin on 10/30/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

struct Media {
    let key: String
    let filename: String
    let filePath: String
    let data: Data
    let mimeType: String
    
    init?(withImage filePath: String, fileName: String) {
        self.key = "image"
        self.mimeType = "image/jpeg"
        self.filename = fileName
        self.filePath = filePath
        let image = UIImage(contentsOfFile: filePath)
        guard let data = image?.jpegData(compressionQuality: 0.7) else { return nil }
        self.data = data
    }
    
}
