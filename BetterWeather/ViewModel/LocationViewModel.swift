//
//  LocationViewModel.swift
//  LocationViewModel
//
//  Created by Aayush Pokharel on 2021-08-12.
//

import CoreLocation
import MapKit
import os
import SwiftUI

@MainActor
final class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @AppStorage(AppStorageKeys.storedLong.rawValue) var lon = ""
    @AppStorage(AppStorageKeys.storedLat.rawValue) var lat = ""
    @AppStorage(AppStorageKeys.storedCity.rawValue) var storedCity = ""

    // MARK: - Location Data Model
    let manager = CLLocationManager()
    var location: CLLocationCoordinate2D?

    private let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier ?? "com.aayush.opensource.BetterWeather",
        category: "Location"
    )

    override init() {
        super.init()
        manager.delegate = self
    }

    func requestLocation() {
        manager.requestLocation()
        logCurrentLocation()

        manager.location?.fetchCityAndCountry(completion: { city, _, _ in
            Task { @MainActor in
                self.storedCity = city ?? "Unknown City"
            }
        })
    }

    nonisolated func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        Task { @MainActor in
            self.logger.error("Location request failed: \(error.localizedDescription, privacy: .public)")
        }
    }

    nonisolated func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        if let location = locations.first?.coordinate {
            Task { @MainActor in
                self.lon = "\(location.longitude)"
                self.lat = "\(location.latitude)"
                self.logCurrentLocation()
            }

        } else {
            return
        }

    }

    private func logCurrentLocation() {
        logger.debug("Latitude: \(self.lat, privacy: .private), longitude: \(self.lon, privacy: .private)")
    }
}

extension CLLocation {
    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ country: String?, _ error: Error?) -> Void) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $0?.first?.country, $1) }
    }
}
