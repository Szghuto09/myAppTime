//
//  LocationModel.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 2/6/21.
//

import Foundation
import Combine

//Structura de la persistencia de datos
struct LocationCitiesModel : Codable {
    var geonames : [GeoNameInfo]?
}

struct GeoNameInfo : Codable {
    var geonameId : Int   // ojo no hay id en la api.......
    var name: String
    var countryCode : String
    var lat: String
    var lng: String
}
