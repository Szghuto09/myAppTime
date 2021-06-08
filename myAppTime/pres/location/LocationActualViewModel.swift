//
//  LocationActualViewModel.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 7/6/21.
//

import Foundation
import CoreLocation


class LocationActualViewModel: NSObject, CLLocationManagerDelegate, ObservableObject {

    @Published var authorizationStatus: CLAuthorizationStatus
        
        private let locationManager: CLLocationManager
    
    @Published var lastSeenLocation: CLLocation?
    @Published var currentPlacemark: CLPlacemark?
        
        override init() {
            locationManager = CLLocationManager()
            authorizationStatus = locationManager.authorizationStatus
            
            super.init()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    
    
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastSeenLocation =  locations.first
        fetchCountryAndCity(for: locations.first)
    }
    
    func fetchCountryAndCity(for location: CLLocation?) {
        guard let location = location else { return }
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) {(placemarks, error) in
            self.currentPlacemark = placemarks?.first
            
        }
        
    }
    
    
}
