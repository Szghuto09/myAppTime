//
//  Models.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 26/5/21.
//

import Foundation
import Combine


//Data
struct WeatherList : Codable {
    var list : [ListStruct]?
 

}

struct ListStruct: Codable{
   //dentro de "list"
    var dt : Int   //falseando id
    var weather : [WeatherListStruct]?
    var dt_txt : String
}


struct WeatherListStruct: Codable {
        
    var id : Int
    var main : String
    var description: String
    var icon: String
}




struct Location: Codable {
    var lat : Double
    var lon : Double
}
