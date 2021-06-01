//
//  DataAssembly.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 28/5/21.
//

import Foundation
import Swinject

class DataAssembly : Assembly {
    func assemble(container: Container) {
        container.register(WeatherApi.self) { _ in
            WeatherApiImpl(baseUrl:"http://api.openweathermap.org/data/2.5/weather?lat=40.447428&lon=-3.609869&appid=828971f619b9ba9b1632c23dff01bec5" )
        }
        
       
    }
}
