//
//  WeatherUseCase.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 28/5/21.


import Foundation
import Combine

protocol WeatherUseCase {
    func getWeather(location: Location) -> AnyPublisher<[String: [ListStruct]], DomainError>
    
}

class WeatherUseCaseImpl : WeatherUseCase {
    
    //instancia del objeto API
    private let weatherApi: WeatherApi
    
    private var weathers: [WeatherViewModel] = []
    
    //constructor
    init() {
        self.weatherApi = WeatherApiImpl()
    }
    
    //devuelve un hasmap
    //trae todas las fechas
    func getWeather(location: Location) -> AnyPublisher<[String: [ListStruct]], DomainError> {
        //Se sirve de la API
        weatherApi.getWeather(location : location)// usar map
            //devolver un hasmap
            .map { result in
                var hasMapResult : [String : [ListStruct]] = [:]
                result.list?.forEach { elemt in
                    let fecha = elemt.dt_txt.prefix(10)
                    //si para esa fecha hay una lista....
                    if (hasMapResult[String(fecha)] != nil) {
                        hasMapResult[String(fecha)]?.append(elemt)
                    } else {
                        //si no hay lista para esa key... creas una nueva
                        //print(fecha)
                        hasMapResult[String(fecha)] = [elemt]
                    }
                }
                return hasMapResult
            }
            .mapError { error -> DomainError in
                .network(error: error)
            }.eraseToAnyPublisher()
    }
    
    
    
}
