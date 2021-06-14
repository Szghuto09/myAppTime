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
        weatherApi.getWeather(location: location)// usar map
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
                        print(fecha)
                        hasMapResult[String(fecha)] = [elemt]
                        
                    }
                }
                
                //                if let result = result.list{
                //                    return [ "2021-06-11" : [result[0], result[1], result[2], result[3]],
                //                             "2021-06-12" : [result[4], result[5], result[6], result[7]],
                //                             "2021-06-13" : [result[8], result[9], result[10], result[11]],
                //                             "2021-06-14" : [result[12], result[13], result[14], result[15]],
                //                             "2021-06-15" : [result[16], result[17], result[18], result[19]],
                //                             "2021-06-16" : [result[20], result[21], result[22], result[23]],
                //                           ]
                //                }
                //                return [ : ]
                return hasMapResult
            }
            .mapError { error -> DomainError in
                .network(error: error)
            }.eraseToAnyPublisher()
    }
    
    
    
}
