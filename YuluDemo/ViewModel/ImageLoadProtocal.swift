//
//  ImageLoadProtocal.swift
//  YuluDemo
//
//  Created by Admin on 11/4/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

protocol ImageLoadModelViewProtocal {
    var ImageFile:String? { get set }
    var IsEditMode:Bool { get }
    
    func getPlaceItem()->MyplacesListItem
}
