//
//  WeatherViewModel.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 1/6/21.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    var id : Int
    let description : String
    
    //Para el preview como ejemplo
    init(){
        self.id = 0
        self.description = ""
    }
    
    //Desde el modelo del servidor
    init(weather: WeatherListStruct) {
        
        self.id = weather.id
        self.description = weather.description
        
    }
    
}
