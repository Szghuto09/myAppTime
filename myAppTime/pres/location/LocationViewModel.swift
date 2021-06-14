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
    var location: Location
    
    //Para el preview como ejemplo
    init() {
        self.id = 0
        self.nameCity = ""
        self.location = Location(lat: 0, lon: 0)
    }
    
    //Desde el modelo del servidor
    init(location: LocationCitiesModel) {
        self.id = location.id
        self.nameCity = location.nameCity
        self.location = Location(lat: location.lat, lon: location.lon)
    }
    
    
}
