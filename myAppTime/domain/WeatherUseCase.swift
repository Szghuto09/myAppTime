//
//  WeatherUseCase.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 28/5/21.
//

//import Foundation
//import Combine
//
//protocol WeatherUseCase {
//    func getWeather() -> AnyPublisher<[WeatherList], DomainError>
//}
//
//class WeatherUseCaseImpl : WeatherUseCase {
//    func getWeather() -> AnyPublisher<[WeatherList], DomainError> {
//        <#code#>
//    }
//    
//   
//    
////    //instancia del objeto API
////    private let weatherApi: WeatherApi
////
////    //constructor
////    init() {
////        self.weatherApi = WeatherApiImpl()
////    }
////
////    func getWeather() -> AnyPublisher<[WeatherList], DomainError> {
////
////        
////        weatherApi.getWeather().mapError { error -> DomainError in
////            .network(error: error)
////        }.eraseToAnyPublisher()
////    }
////
//}
