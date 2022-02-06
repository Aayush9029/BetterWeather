//
//  LocationViewModel.swift
//  LocationViewModel
//
//  Created by Aayush Pokharel on 2021-08-12.
//

import SwiftUI
import CoreLocation
import MapKit

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @AppStorage(AppStorageKeys.storedLong.rawValue) var lon = ""
    @AppStorage(AppStorageKeys.storedLat.rawValue) var lat = ""
    @AppStorage(AppStorageKeys.storedCity.rawValue) var storedCity = ""

    // MARK: - Location Data Model
    let manager = CLLocationManager()
     var location: CLLocationCoordinate2D?

    override init() {
        super.init()
        manager.delegate = self
    }

    func requestLocation() {
        manager.requestLocation()
        printDebugString()

        manager.location?.fetchCityAndCountry(completion: { city, _, _ in
            self.storedCity = city ?? "Unknown City"
        })
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("LOCATION ERROR OCCURED")
        print(error.localizedDescription)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        if let location = locations.first?.coordinate {
            lon = "\(location.longitude)"
            lat = "\(location.latitude)"

            printDebugString()

        } else {
            return
        }

    }

    private func printDebugString() {
        print("Latitude: \(lat)\nLongitude: \(lon)")
    }
}

extension CLLocation {
    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ country: String?, _ error: Error?) -> Void) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $0?.first?.country, $1) }
    }
}
