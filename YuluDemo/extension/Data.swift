//
//  Data.swift
//  YuluDemo
//
//  Created by Admin on 10/30/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation


extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
