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

class WeatherListViewModel: NSObject, ObservableObject {
    
    private  var cancelables = Set<AnyCancellable>()

    @Published var weathers: [WeatherViewModel] = []
    
    private var locationManager = CLLocationManager()
    
    @Published var locationActual : LocationViewModel
    
    @Published var currentPlacemark: CLPlacemark?
    

    
    @Published var listKeys : [String]
    @Published var hashMapListStruct : [String : [WeatherViewModel]]
    
    
    
    private var weatherUseCase : WeatherUseCase
    
    
    override init() {
        
        locationActual = LocationViewModel()
        weatherUseCase = WeatherUseCaseImpl()
        listKeys = []
        hashMapListStruct = [:]
        super.init()
        locationManager.delegate = self
        
    }
    
    //pedir permisos + actualizar pos
    func getActualLocation() {
        //1º
        print("*****ENTRANDO******")
        print("\( locationManager.requestWhenInUseAuthorization())")
        locationManager.requestWhenInUseAuthorization()
        print("\(locationManager.startUpdatingLocation())")
        locationManager.startUpdatingLocation()
    }
    
    
    func getDataWeatherActualLocation(forCoordinates coordinates: CLLocationCoordinate2D, currentPlacemark: CLPlacemark) {
        //5º
        self.locationActual =  LocationViewModel(location: .init(id: 0, nameCity:currentPlacemark.locality ?? "" ,countryCode: (currentPlacemark.isoCountryCode) ?? "" ,  lat: coordinates.latitude, lon: coordinates.longitude))
        print("locationActual lat : \(locationActual.location.lat)")
        print("locationActual lon : \(locationActual.location.lon)")
        print("locationActual locality : \(locationActual.nameCity)")
        print("locationActual countryCode : \(locationActual.countryCode)")
        //Con la pos obtenida paso a obtener datos del clima
       //6º
//       self.fetchWeather(location: Location(lat: coordinates.latitude, lon: coordinates.longitude))
     
    }
    
    func  fetchWeather(location : Location) {
        weatherUseCase.getWeather(location: location)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            //map transformar
            .map { result in
                //print(result)
                //mapeas list que es una lista
                //cada objeto que mapeas, es una struct ListStruct
                 result.mapValues { values in
                    values.map { weather in
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
    
    //2º
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]) {
        guard  let location = locations.first else { return }
        //Contiene las coordenadas (lat, lon) que necesito
        print("Location result: \(location)")

        let geocoder = CLGeocoder()
        print("siguiente linea que se ejecuta")
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            //3º
            self.currentPlacemark = placemarks?.first
            print("****** \(self.currentPlacemark)")
            self.getDataWeatherActualLocation(forCoordinates:  location.coordinate,currentPlacemark: self.currentPlacemark!)
        }
        //4º
        
    }
    
    
    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error) {
        print("Error \(error)")
    }
}
