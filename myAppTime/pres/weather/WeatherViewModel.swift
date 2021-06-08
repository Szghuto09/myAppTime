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
    
    //---------------------
    //var nameCity : String
    
    
    //Para el preview como ejemplo
    init(){
        weatherStruct = []
        self.dt_txt = ""
        self.dt = 0
        self.mainInfo = MainInfo(temp: 0)
        //self.nameCity = ""
    }
    
    //Desde el modelo del servidor
    init(weather: ListStruct) {
        self.dt = weather.dt
        self.dt_txt = weather.dt_txt
        self.weatherStruct = weather.weather!
        self.mainInfo = weather.main!
        
    }
    
    

    
}
