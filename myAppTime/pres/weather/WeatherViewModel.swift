//
//  WeatherViewModel.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 1/6/21.
//

import Foundation

class WeatherViewModel: ObservableObject {
    var dt : Int
    var dt_txt: String
    var weatherStruct : [WeatherListStruct]
    var mainInfo : MainInfo
    
    var windInfo: WindInfo
    //Para el preview como ejemplo
    init() {
        weatherStruct = []
        self.dt_txt = ""
        self.dt = 0
        self.mainInfo = MainInfo(temp: 0, temp_min: 0, temp_max: 0, pressure: 0, sea_level: 0, grnd_level: 0, humidity: 0)
        self.windInfo = WindInfo(speed: 0, deg: 0, gust: 0)
        
    }
    
    //Desde el modelo del servidor
    init(weather: ListStruct) {
        self.dt = weather.dt
        self.dt_txt = weather.dt_txt
        self.weatherStruct = weather.weather!
        self.mainInfo = weather.main!
        self.windInfo = weather.wind!
        
    }
}
