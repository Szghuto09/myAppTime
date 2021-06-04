//
//  WeatherListViewModel.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 3/6/21.
//

import Foundation
import Combine
import SwiftUI

class WeatherListViewModel: ObservableObject {
    
    private  var cancelables = Set<AnyCancellable>()
    
    private  var weatherApi: WeatherApi
    
    @Published var weathers: [WeatherViewModel] = []
   
    
    init(){
        weatherApi = WeatherApiImpl()
    }
    
    func  fetchWeather(location: Location) {
        
        weatherApi.getWeather(location: location)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .map { result in
                print(result)
                //mapeas list que es una lista
                //cada objeto que mapeas, es una struct ListStruct
                
                 return result.list?.map{ listStruct -> WeatherViewModel in
                    return WeatherViewModel(weather: listStruct)
//                    guard let weather = listStruct?[0] else {
//                        return WeatherViewModel()
//                    }
//                    return WeatherViewModel(weather: weather)
                } ?? []
                
            }.catch { error -> AnyPublisher<[WeatherViewModel], Never> in
                return Empty(completeImmediately: true).eraseToAnyPublisher()
                
            }.assign(to: \.weathers, on: self)
            .store(in: &cancelables)
    }
    
    
}
