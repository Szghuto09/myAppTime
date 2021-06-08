//
//  WeatherListViewModel.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 3/6/21.
//

import Foundation
import Combine
import SwiftUI
import CoreLocation

class WeatherListViewModel:NSObject, ObservableObject {
    
    private  var cancelables = Set<AnyCancellable>()
    
    private  var weatherApi: WeatherApi
    
    @Published var weathers: [WeatherViewModel] = []
   
    
    private var locationManager = CLLocationManager()
    
    @Published var locationActualModel : LocationViewModel
   
    
    override init(){
       
        weatherApi = WeatherApiImpl()
        locationActualModel = LocationViewModel()
        super.init()
        locationManager.delegate = self
    
    }
    
    //pedir permisos + actualizar pos
    func getActualLocation(){
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
   
    func getDataWeatherActualLocation(forCoordinates coordinates: CLLocationCoordinate2D){
                
        //OJO:
        locationActualModel = LocationViewModel(location: .init(id: 0, nameCity: "", lat: coordinates.latitude, lon: coordinates.longitude))
        //Con la pos obtenida paso a obtener datos del clima
        self.fetchWeather(location: Location(lat: coordinates.latitude, lon: coordinates.longitude))
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
                } ?? []
                
            }.catch { error -> AnyPublisher<[WeatherViewModel], Never> in
                return Empty(completeImmediately: true).eraseToAnyPublisher()
                
            }.assign(to: \.weathers, on: self)
            .store(in: &cancelables)
    }
    
    
}

extension WeatherListViewModel: CLLocationManagerDelegate {
    
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]) {
        guard  let location = locations.first else { return }
        getDataWeatherActualLocation(forCoordinates:  location.coordinate)
    }
    
    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error) {
        print("Error \(error)")
    }
}
