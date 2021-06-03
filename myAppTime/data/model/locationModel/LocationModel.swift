//
//  LocationModel.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 2/6/21.
//

import Foundation
import Combine

struct LocationCitiesModel : Codable {
    var id : Int
    var nameCity: String 
    var lat: Double
    var lon: Double
}
