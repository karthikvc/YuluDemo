//
//  CoreDataManager.swift
//  YuluDemo
//
//  Created by Admin on 10/30/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class CoreDataManager {
    
    class func FetchData()-> [MyplacesListItem] {
        
        //1
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return []
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Place")
        //3
        do {
            let places = try managedContext.fetch(fetchRequest)
            return self.convertMyplace(With: places as! [Place])//places as! [MyplacesListItem]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return []
    }
    
    class func SaveData(places: [MyplacesListItem]) {
        
        //DispatchQueue.global().async {
        
            for item in places {
                self.saveItem(place: item)
            }
            
        //}
        
        
        //person.
        
    }
    
    
    class func saveItem(place: MyplacesListItem) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //managedContext.perform {
            
            let entity = NSEntityDescription.entity(forEntityName: "Place", in: managedContext )!
            let placeEnity = Place(entity: entity, insertInto: managedContext)
        
            placeEnity.id  = place.placeId
            placeEnity.title = place.title
            placeEnity.discription = place.description
            placeEnity.latitute = place.latitude
            placeEnity.longtitute = place.longitude
            placeEnity.imageurl = place.imageUrlPath
            
            do {
                try managedContext.save()
            } catch let error {
                print(error)
            }
        //}
       
    }
    
    class func fetchPlaceBy(withId placeId: String) -> Bool {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return false
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Place")
        
        fetchRequest.predicate = NSPredicate(format: "id == %@", placeId)
        
        do {
            let places = try managedContext.fetch(fetchRequest)
            
            if places.count > 1 {
            
            let place = places[0] as! Place
            
           
            print(place.id!)
            if places.count > 0 {
               return true
            
            }
            }
            
            
            return false
            
            //return self.convertMyplace(With: places as! [Place])//places as! [MyplacesListItem]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return false
        
    }
    
    
    private class func convertMyplace(With mobContext: [Place]) -> [MyplacesListItem]{
        
        var myplacesList = [MyplacesListItemModel]()
        
        for placeEnity in mobContext {
            
            var myplace = MyplacesListItemModel()
            myplace.placeId = placeEnity.id!
            myplace.title = placeEnity.title!
            myplace.longitude = placeEnity.longtitute
            myplace.latitude = placeEnity.longtitute
            myplace.description = placeEnity.discription!
            myplace.imageUrlPath = placeEnity.imageurl
            
            myplacesList.append(myplace)
            
            
        }
        
        return myplacesList
    }
    
    
}
