//
//  MapViewController.swift
//  YuluDemo
//
//  Created by Admin on 10/22/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import GoogleMaps
import MapKit

class MapViewController: UIViewController,StoryboardIdentifiable {

    private var viewModel:MapViewModel! // ViewModel
    let locationManager = CLLocationManager()
    @IBOutlet var mapView:GMSMapView!
    private let marker = GMSMarker()
    var location: CLLocationCoordinate2D?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.startUpdatingLocation()
        
        // Do any additional setup after loading the view.
        if self.viewModel.isEditMode() {
          self.mapView.delegate = self
        }
        //let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 15.0)
        //mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        //view = mapView
        
        // Creates a marker in the center of the map.
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mapView
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        if self.viewModel.isEditMode() == false {
            let numberofLocation = self.viewModel.numberofLocation()
            for i in 0...numberofLocation-1 {
                let item = self.viewModel.getPlaceItem(index: i)
                let lat =  item.latitude   //viewModel.getlatitute()
                let long =  item.longitude //viewModel.getlongtitute()
                
                self.location = CLLocationCoordinate2D(latitude: lat, longitude: long)
                
                if let location = self.location {
                    let marker = GMSMarker()
                    marker.position = location //CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
                    marker.title = item.title
                    
                    marker.map = mapView
                    if i == 0 {
                        mapView.camera = GMSCameraPosition.camera(withTarget: location, zoom:2.8)
                    }
                }
            }
        } else {
            
            let lat =  viewModel.getlatitute()
            let long =  viewModel.getlongtitute()
            self.location = CLLocationCoordinate2D(latitude: lat, longitude: long)
            marker.position = location!
            marker.map = mapView
            mapView.camera = GMSCameraPosition.camera(withTarget: location!, zoom:2.8)
    }
    }
    
    class func controller(viewModel: MapViewModel) -> MapViewController {
        let vc:MapViewController = UIStoryboard (storyboard: .main).instantiateViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    @IBAction func locationAddAction(_ sender: Any) {
        
        self.viewModel.addLocation(latitude: marker.position.latitude, longitude: marker.position.longitude)
        self.navigationController?.popViewController(animated: true)
        
    }
}

extension MapViewController: CLLocationManagerDelegate,GMSMapViewDelegate{
    
     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("locations")
        
        manager.stopUpdatingLocation()
        
        let location = locations.last
        
        let target = CLLocationCoordinate2D(latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
        
        
        marker.position = target //CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        //marker.title = "Sydney"
        //marker.snippet = "Australia"
        marker.map = mapView
        
        mapView.camera = GMSCameraPosition.camera(withTarget: target, zoom:12)
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("You tapped at \(coordinate.latitude), \(coordinate.longitude)")
        
        //let marker = GMSMarker()
        marker.position = coordinate //CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        //marker.title = "Sydney"
        //marker.snippet = "Australia"
        marker.map = mapView
    }
   
}
