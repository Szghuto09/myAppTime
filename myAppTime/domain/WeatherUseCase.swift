//
//  WeatherUseCase.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 28/5/21.
//
//
//import Foundation
//import Combine
//
//protocol WeatherUseCase {
//    func getWeather() -> AnyPublisher<[String: [WeatherList]], DomainError>
//}
//
//class WeatherUseCaseImpl : WeatherUseCase {
//    func getWeather() -> AnyPublisher<[WeatherList], DomainError> {
//        <#code#>
//    }
//    
//   
//    
//    //instancia del objeto API
//    private let weatherApi: WeatherApi
//
//    //constructor
//    init() {
//        self.weatherApi = WeatherApiImpl()
//    }
//
//    //devuelve un hasmap
//    //trae todas las fechas
//    func getWeather() -> AnyPublisher<[String: [WeatherList] ], DomainError> {
//        weatherApi.getWeather().mapError { error -> DomainError in
//            .network(error: error)
//        }.eraseToAnyPublisher()
//    }
//
//}
