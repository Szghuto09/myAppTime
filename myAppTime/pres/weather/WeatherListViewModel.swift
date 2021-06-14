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
    
    
    
    @Published var weathers: [WeatherViewModel] = []
    
    
    private var locationManager = CLLocationManager()
    
    @Published var locationActualModel : LocationViewModel
    
    @Published var currentPlacemark: CLPlacemark?
    
    @Published var nameCity : String
    
    @Published var listKeys : [String]
    @Published var hashMapListStruct : [String : [WeatherViewModel]]
    
    
    
    private var weatherUseCase : WeatherUseCase
    
    
    override init(){
        
        nameCity = ""
        locationActualModel = LocationViewModel()
        weatherUseCase = WeatherUseCaseImpl()
        listKeys = []
        hashMapListStruct = [:]
        super.init()
        locationManager.delegate = self
        
    }
    
    //pedir permisos + actualizar pos
    func getActualLocation(){
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
    func getDataWeatherActualLocation(forCoordinates coordinates: CLLocationCoordinate2D){
        self.nameCity = currentPlacemark?.country ?? ""
        //OJO:
        locationActualModel = LocationViewModel(location: .init(id: 0, nameCity: "", lat: coordinates.latitude, lon: coordinates.longitude))
        //Con la pos obtenida paso a obtener datos del clima
        self.fetchWeather(location: Location(lat: coordinates.latitude, lon: coordinates.longitude))
    }
    
    func  fetchWeather(location: Location) {
        
        //        weatherApi.getWeather(location: location)
        //            .subscribe(on: DispatchQueue.global(qos: .background))
        //            .receive(on: DispatchQueue.main)
        //            .map { result in
        //                print(result)
        //                //mapeas list que es una lista
        //                //cada objeto que mapeas, es una struct ListStruct
        //                return result.list?.map{ listStruct -> WeatherViewModel in
        //                    return WeatherViewModel(weather: listStruct)
        //                } ?? []
        //            }.catch { error -> AnyPublisher<[WeatherViewModel], Never> in
        //                return Empty(completeImmediately: true).eraseToAnyPublisher()
        //
        //            }.assign(to: \.weathers, on: self)
        //            .store(in: &cancelables)
        
        //[String : [ListStruct]]
        weatherUseCase.getWeather(location: location)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            //map transformar
            .map { result in
                
                print(result)
                //mapeas list que es una lista
                //cada objeto que mapeas, es una struct ListStruct
                return result.mapValues { values in
                    values.map{ weather in
                        WeatherViewModel(weather: weather)
                    }
                }
            }.catch { error -> AnyPublisher<[String: [WeatherViewModel]], Never> in
                return Empty(completeImmediately: true).eraseToAnyPublisher()
                
            }
            //sink asignar mas cosas
            .sink(receiveValue: { items  in
                // items[0] == ListStruct
                self.listKeys = Array(items.keys)
                self.hashMapListStruct = items
                
            })
            .store(in: &cancelables)
    }
    
    
}

extension WeatherListViewModel: CLLocationManagerDelegate {
    
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]) {
        guard  let location = locations.first else { return }
        getDataWeatherActualLocation(forCoordinates:  location.coordinate)
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            self.currentPlacemark = placemarks?.first
        }
    }
    
    
    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error) {
        print("Error \(error)")
    }
}
