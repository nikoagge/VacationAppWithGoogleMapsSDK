//
//  VacationDestination.swift
//  VacationAppWithGoogleMapsSDK
//
//  Created by Nikolas on 16/11/2018.
//  Copyright © 2018 Nikolas. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps


class DestinationVacation: NSObject {
    
    let name: String
    let location: CLLocationCoordinate2D
    let zoom: Float
    
    init(name: String, location: CLLocationCoordinate2D, zoom: Float) {
        
        self.name = name
        self.location = location
        self.zoom = zoom
    }
}
