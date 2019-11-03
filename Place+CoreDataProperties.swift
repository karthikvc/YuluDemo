//
//  Place+CoreDataProperties.swift
//  
//
//  Created by Admin on 10/30/19.
//
//

import Foundation
import CoreData


extension Place {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Place> {
        return NSFetchRequest<Place>(entityName: "Place")
    }

    @NSManaged public var discription: String?
    @NSManaged public var imageurl: String?
    @NSManaged public var latitute: Double
    @NSManaged public var longtitute: Double
    @NSManaged public var title: String?
    @NSManaged public var id: String?
}
