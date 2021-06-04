//
//  ViewModel.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 26/5/21.
//

import Foundation
import Combine
import SwiftUI



//data needed by view

//class ViewModel: ObservableObject {
//    
//    private var cancelables = Set<AnyCancellable>()
//    
//    //declarado
//    private var weatherApi: WeatherApi
//
//    //modelo vacio
//    //@Published var weatherList : WeatherList
//    
//    @Published var weathers: [WeatherViewModel]
//    private let location : Location
//    
//    init(location: Location) {
//        print("Entra en el constructor")
//        //instancio api
//        weatherApi = WeatherApiImpl()
//        //instancia con la struct WeatherList
//        self.location = location
//    }
//    
//    func fetchWeather() {
//
//        // devuelve WeatherList
//        //pasarlo al view model
//        weatherApi.getWeather(location: location)
//            .subscribe(on: DispatchQueue.global(qos: .background))
//            .receive(on: DispatchQueue.main)
//            .map { result in
//                print(result)
//                return result.list?.map{ listStruct -> WeatherViewModel in
//                    guard let weather = listStruct.weather?[0] else {
//                        return WeatherViewModel()
//                    }
//                    return WeatherViewModel(weather: weather)
//                } ?? []
//
//            }.catch { error -> AnyPublisher<[WeatherViewModel], Never> in
//                return Empty(completeImmediately: true).eraseToAnyPublisher()
//            }.assign(to: \.weathers, on: self)
//            .store(in: &cancelables)
//
//        
//    }
//    
//    
//    }
//    
//    
//
