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
    var main : MainInfo?
    var wind : WindInfo?
}


struct MainInfo: Codable {
    var temp : Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Int
    var sea_level : Int
    var grnd_level: Int
    var humidity: Int
    
}

struct WindInfo: Codable {
    var speed : Double
    var deg : Int
    var gust : Double
}

struct WeatherListStruct: Codable {
        
    var id : Int
    var main : String
    var description: String
  
    
}

struct Location: Codable {
    var lat : Double
    var lon : Double
}
