//
//  LocationViewModel.swift
//  LocationViewModel
//
//  Created by Aayush Pokharel on 2021-08-12.
//

import SwiftUI
import CoreLocation

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    @AppStorage(AppStorageKeys.storedLong.rawValue) var long = "";
    @AppStorage(AppStorageKeys.storedLong.rawValue) var lat = "";

    // MARK: - Location Data Model
    let manager = CLLocationManager()
     var location: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print("LOCATION ERROR OCCURED")
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first?.coordinate {
            long = "\(location.longitude)"
            lat = "\(location.latitude)"
        }else{
            return
        }

    }

    
 
    private func printDebugString(){
        print("Latitude: \(long)\nLongitude: \(long)")
    }
}

    
