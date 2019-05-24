//
//  ViewController.swift
//  VacationAppWithGoogleMapsSDK
//
//  Created by Nikolas on 16/11/2018.
//  Copyright © 2018 Nikolas. All rights reserved.
//

import UIKit
import GoogleMaps


class RootVC: UIViewController {

    
    var mapView: GMSMapView?
    
    var currentDestination: DestinationVacation?
    
    let destinations = [DestinationVacation(name: "Ανδρέα Παπανδρέου 19", location: CLLocationCoordinate2DMake(38.043582, 23.797427), zoom: 13), DestinationVacation(name: "Κερασούντος 31-29", location: CLLocationCoordinate2DMake(41.083269, 23.551725), zoom: 13), DestinationVacation(name: "Νιγρίτης 54-58", location: CLLocationCoordinate2DMake(41.085113, 23.554772), zoom: 13), DestinationVacation(name: "Νικομηδείας 90-88", location: CLLocationCoordinate2DMake(41.085606, 23.551671), zoom: 13)]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        GMSServices.provideAPIKey("AIzaSyC6jZHNI1Xe2etNCU8RzONyEtfRpAir9fM")
        
        let currentLocation = CLLocationCoordinate2DMake(38.043582, 23.797427)
        
        let camera = GMSCameraPosition.camera(withLatitude: 38.043582, longitude: 23.797427, zoom: 13)
        
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let marker = GMSMarker(position: currentLocation)
        marker.title = "CLMSUK"
        marker.map = mapView
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextLocation))
    }
    
    
    @objc func nextLocation() {
        
        if currentDestination == nil {
            
            currentDestination = destinations.first
            
            //mapView?.camera = GMSCameraPosition.camera(withTarget: (currentDestination?.location)!, zoom: (currentDestination?.zoom)!)
            
//            mapView?.animate(to: GMSCameraPosition.camera(withTarget: (currentDestination?.location)!, zoom: (currentDestination?.zoom)!))
//
//            let locationMarker = GMSMarker(position: (currentDestination?.location)!)
//            locationMarker.title = currentDestination?.name
//            //locationMarker.snippet = "Καλύβια"
//            locationMarker.map = mapView
        } else {
            
            if let index = destinations.index(of: currentDestination!) {
                
                currentDestination = destinations[index + 1]
                
                //mapView?.camera = GMSCameraPosition.camera(withTarget: (currentDestination?.location)!, zoom: (currentDestination?.zoom)!)
                
//                mapView?.animate(to: GMSCameraPosition.camera(withTarget: (currentDestination?.location)!, zoom: (currentDestination?.zoom)!))
//
//                let locationMarker = GMSMarker(position: (currentDestination?.location)!)
//                locationMarker.title = currentDestination?.name
//                locationMarker.map = mapView
            }
        }
        
//        let nextLocation = CLLocationCoordinate2DMake(41.082000, 23.529357)
//
//        mapView?.camera = GMSCameraPosition.camera(withLatitude: nextLocation.latitude, longitude: nextLocation.longitude, zoom: 13)
        
        setMapCamera()
    }
    
    
    private func setMapCamera() {
        
        CATransaction.begin()
        //2 -> 2 seconds
        CATransaction.setValue(2, forKey: kCATransactionAnimationDuration)
        mapView?.animate(to: GMSCameraPosition.camera(withTarget: (currentDestination?.location)!, zoom: (currentDestination?.zoom)!))
        CATransaction.commit()
        
        let locationMarker = GMSMarker(position: (currentDestination?.location)!)
        locationMarker.title = currentDestination?.name
        locationMarker.map = mapView
    }
}

