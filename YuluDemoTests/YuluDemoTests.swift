//
//  YuluDemoTests.swift
//  YuluDemoTests
//
//  Created by Admin on 10/18/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import XCTest
@testable import YuluDemo

class YuluDemoTests: XCTestCase {

    private var dataProvider = MyPlacesAPIDataProvider()
    private let addnewplacedataProvider = AddMyplaceAPIDataProvider()
     private var createPlaceDataProvider: CreatePlaceWithImageAPIDataProvider? = CreatePlaceWithImageAPIDataProvider()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        dataProvider.fetchMyPlacesListFor("test") { (places, error) in
            
            XCTAssert((places != nil), "load places fail")
            
            XCTAssert((places?.result.count)!>0, "places is not loaded")
        }
    }
    
    func testgetSinglePlaces() {
        
        //5da71aa521176260abcc9a5e
        
        dataProvider.fetchMyPlaceFor("5da96aebde462560b9a3f38a") { (place, error) in
            
            XCTAssert((place != nil), "place load is fail")
            
            XCTAssertEqual(place?.title, "Yulu 4c", "place title is changed")
        }
        
    }
    
    func testCreateNewPlace() {
        
        var myPlace = MyplacesListItemModel()
        
        myPlace.title = "test1 house"
        myPlace.description = "hello test1"
        myPlace.latitude = 0.099
        myPlace.longitude = 0.8999
        
        let newplaceexpectation  = expectation(description: "Create New Place")
        
        self.addnewplacedataProvider.addMyPlace(myPlace){ (result, error) in
            
            //handler(result,error)
            XCTAssertEqual(result, "Success", "place creation is fail")
            newplaceexpectation.fulfill()
        }
        
        wait(for: [newplaceexpectation], timeout: 5)
        
    }
    
    func testCreateNewPlaceWithImage() {
        
        let mainBundle = Bundle.main
        let image = mainBundle.path(forResource: "testhouse", ofType: "jpg")
        
        var myPlace = MyplacesListItemModel()
        
        myPlace.title = "test4 house"
        myPlace.description = "hello test3"
        myPlace.latitude = 0.099
        myPlace.longitude = 0.8999
         let newplaceexpectation  = expectation(description: "Create New Place with Image")
        
        self.createPlaceDataProvider?.uploadImage(myPlace, imageFile: image!, completionHandler: { (result, error) in
            
            XCTAssertEqual(result, "Success", "new place creation is fail")
            newplaceexpectation.fulfill()
            
        })
        
        wait(for: [newplaceexpectation], timeout: 10)
    }

    

}
