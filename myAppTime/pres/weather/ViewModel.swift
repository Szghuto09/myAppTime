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

class WeatherListViewModel: ObservableObject {
    
    private var cancelables = Set<AnyCancellable>()
    
    //declarado
    private var weatherApi: WeatherApi

    //modelo vacio
    //@Published var weatherList : WeatherList
    
    @Published var weathers: [WeatherViewModel] = []
    
    init() {
        print("Entra en el constructor")
        //instancio api
        weatherApi = WeatherApiImpl()
        //instancia con la struct WeatherList
        
    }
    
    func fetchWeather() {
        
        // devuelve WeatherList
        weatherApi.getWeather()
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .map {  items in
                return items.list.map{ item in
                    //$0 cada elemento del map
                    if let item = item[0].weather?[0] {
                        return WeatherViewModel(weather: item)
                    }
                    
                    return WeatherViewModel()
                } ?? []
                
            }.catch { error -> AnyPublisher<[WeatherViewModel], Never> in
                return Empty(completeImmediately: true).eraseToAnyPublisher()
            }.assign(to: \.weathers, on: self)
            .store(in: &cancelables)
        
    }
    
    
    
   
        
        
    }
    
    

