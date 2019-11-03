//
//  ImageUploadAPIResource.swift
//  YuluDemo
//
//  Created by Admin on 10/26/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit

protocol ImageUploadAPIResource: EditApiResource {
    
    var imageFile:String { get }
    var titleName:String { get }
}

typealias Parameters = [String: String]

extension ImageUploadAPIResource {
    
   
    var headers: [String: String] {
      
        return [
            "content-type": "multipart/form-data; boundary =----WebKitFormBoundary7MA4YWxkTrZu0gW"]
        }
    
    var parameters: [String: String] {
       return [
    
        //[
            "title": titleName
        //]
//        [
//            "name": "image",
//            "value": " test' house",
//            "fileName": "test.jpg",
//            "filePath": "\(imageFile)",
//            "content-type":"image/jpeg"
//        ]
    ]
    }
    
    var urlRequest: URLRequest {
        var urlrequest = URLRequest(url: self.url)
       // var body = ""
       // var bodyString = ""
        //var error: NSError? = nil
        //let boundary = generateBoundaryString()
        
        let media = Media(withImage: imageFile, fileName: "test.jpg")!
        let boundary = "----WebKitFormBoundary7MA4YWxkTrZu0gW"
        let data = createDataBody(withParameters: parameters, media: [media], boundary: boundary)
        
        //var nsData = Data()
        
//        for param in parameters {
//            let paramName = param["name"]!
//            bodyString = "--\(boundary)\r\n"
//            body += bodyString
//            nsData.append(bodyString.data(using:.utf8)!)
//
//            bodyString = "Content-Disposition: form-data; name = \"\(paramName)\""
//
//            body += bodyString
//            nsData.append(bodyString.data(using: .utf8)!)
//
//            if let filepath = param["filePath"] {
//                let filename = param["fileName"]
//                let contentType = param["content-type"]!
//                do {
//
//                   let image  = UIImage(contentsOfFile: filepath)
//                    let imgData = (image?.jpegData(compressionQuality: 0.75))!
//                    let con = String(decoding: imgData, as: UTF8.self)
//                    //let fileContent = imgData.base64EncodedString()
//                    //let fileContent = String(data: imgData, encoding: .utf8)!
//                    //let fileContent = try String(contentsOfFile: filepath, encoding: String.Encoding.utf8)
//                    //bodyString = "\"test.jpg\"\r\n"
//
//                    bodyString = "; filename=\"\(filename!)\"\r\n"
//                    bodyString += "Content-Type: \(contentType)\r\n\r\n"
//
//                    body += bodyString
//                    nsData.append(bodyString.data(using: .utf8)!)
//
//                    nsData.append(imgData)
//
//                    body += con
//
//
//                } catch let error {
//                    print(error as Any)
//
//                }
//
//            } else
//            if let paramValue = param["value"] {
//                bodyString = "\r\n\r\n\(paramValue)"
//                body += bodyString
//                nsData.append(bodyString.data(using: .utf8)!)
//
//            }
//        }
        
        //bodyString = "\r\n--\(boundary)--\r\n"
        //body += bodyString
        //nsData.append(bodyString.data(using:.utf8)!)
        
        urlrequest.allHTTPHeaderFields = headers
        urlrequest.httpMethod = methodType
        urlrequest.httpBody = data //body.data(using: .utf8)
        
        return urlrequest
    }
    
    
    func createDataBody(withParameters params: Parameters?, media: [Media]?, boundary: String) -> Data {
        
        let lineBreak = "\r\n"
        var body = Data()
        
        if let parameters = params {
            for (key, value) in parameters {
                body.append("--\(boundary + lineBreak)")
                body.append("Content-Disposition: form-data; name=\"\(key)\"\(lineBreak + lineBreak)")
                body.append("\(value + lineBreak)")
            }
        }
        
        if let media = media {
            for photo in media {
                body.append("--\(boundary + lineBreak)")
                body.append("Content-Disposition: form-data; name=\"\(photo.key)\"; filename=\"\(photo.filename)\"\(lineBreak)")
                body.append("Content-Type: \(photo.mimeType + lineBreak + lineBreak)")
                body.append(photo.data)
                body.append(lineBreak)
            }
        }
        
        body.append("--\(boundary)--\(lineBreak)")
        
        return body
    }
    
}

