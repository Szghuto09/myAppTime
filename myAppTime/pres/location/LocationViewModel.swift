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
    let lat: Double
    let lon: Double
    
    //Para el preview como ejemplo
    init(){
        self.id = 0
        self.nameCity = ""
        self.lat = 0
        self.lon = 0
    }
    
    //Desde el modelo del servidor
    init(location: LocationCitiesModel) {
        self.id = location.id
        self.nameCity = location.nameCity
        self.lat = location.lat
        self.lon = location.lon
    }
    
    
}
