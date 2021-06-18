//
//  LocationViewModel.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 3/6/21.
//

import Foundation

class LocationViewModel: ObservableObject {
    
    var id : Int
    var nameCity : String
    var countryCode: String
    var location: Location
    
    //Para el preview como ejemplo
    init() {
        self.id = 0
        self.nameCity = ""
        self.countryCode = ""
        self.location = Location(lat: 0, lon: 0)
    }
    
    //Desde el modelo domain
    init(location: LocationCitiesModelDomain) {
        self.id = location.id
        self.nameCity = location.nameCity
        self.countryCode = location.countryCode
        self.location = Location(lat: location.lat, lon: location.lon)
    }
    
    
}
