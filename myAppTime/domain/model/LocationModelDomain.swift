//
//  LocationModelDomain.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 16/6/21.
//

import Foundation
import Combine

//Struct necesario para las vistas
struct LocationCitiesModelDomain : Codable {
    var id : Int
    var nameCity: String
    var countryCode: String
    var lat: Double
    var lon: Double
}
