//
//  Models.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 26/5/21.
//

import Foundation


//Data

struct WeatherModel: Codable {
    //coord contiene un diccionario
    let coord: CoordInfo
    let weather: [weatherInfo]
    let base: String
    let main: mainInfo
    let visibility: Int
    let wind: WindInfo
    
    let clouds: CloudsWeather
    let dt: Int
    let sys: SysInfo
    
    let timezone: Int
    let id: Int
    let name:String
    let cod:Int
}

struct CoordInfo: Codable {
    let lon: Float
    let lat: Float

}
struct weatherInfo: Codable {
    //let id:Int
    let main: String
    let description: String
    //let icon: String
    
    
}

struct mainInfo: Codable {
    let temp: Float
    let temp_min: Float
    let temp_max: Float
    let pressure: Float
    let humidity: Float
}

struct WindInfo: Codable {
    let speed:Float
    let deg: Int
   
}

struct CloudsWeather: Codable {
    let all: String
    
}

struct SysInfo: Codable {
    let country: String
    
}


