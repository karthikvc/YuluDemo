//
//  MyPlacesJson.swift
//  YuluDemo
//
//  Created by Admin on 10/20/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

struct MyPlacesJson : Codable {
    let id : String?
    let title : String?
    let latitude : Double?
    let longitude : Double?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case title = "title"
        case latitude = "latitude"
        case longitude = "longitude"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
    }
    
}
