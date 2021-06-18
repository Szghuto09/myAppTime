//
////  LocationApi.swift
////  myAppTime
////
////  Created by Edwin Alberto Chuchón Alva on 2/6/21.
////
//
//import Foundation
//import Combine
//
//
//protocol LocationApiMock {
//    
//    func getLocation () -> AnyPublisher<[LocationCitiesModel],HttpError>
//    func getLocation (nameCity: String) -> AnyPublisher<[LocationCitiesModel],HttpError>
//}
//
//class LocationApiMockImpl: HttpApiRequest<[LocationCitiesModel]>, LocationApiMock {
//    
//    
//    override init() {
//    }
//    //getLocation devuelve una lista de objetos struct LocationCitiesModel
//    func getLocation() -> AnyPublisher<[LocationCitiesModel],HttpError> {
//        
//        let city1  = LocationCitiesModel(id: 0,nameCity: "Madrid", lat: -3.70325, lon: 40.4167)
//        let city2 = LocationCitiesModel(id: 1,nameCity: "Alcorcon", lat: 40.34582, lon: -3.82487)
//        let city3 = LocationCitiesModel(id: 2,nameCity: "Alcobendas", lat: 40.5475, lon: -3.64209)
//        return Just([city1,city2,city3]).setFailureType(to: HttpError.self).eraseToAnyPublisher()
//    }
//    
//    func getLocation(nameCity: String) -> AnyPublisher<[LocationCitiesModel], HttpError> {
//        
//        let city1  = LocationCitiesModel(id: 0,nameCity: "Madrid", lat: -3.70325, lon: 40.4167)
//        let city2 = LocationCitiesModel(id: 1,nameCity: "Alcorcon", lat: 40.34582, lon: -3.82487)
//        let city3 = LocationCitiesModel(id: 2,nameCity: "Alcobendas", lat: 40.5475, lon: -3.64209)
//        let city4 = LocationCitiesModel(id: 2,nameCity: "Alcala de Henares", lat: 40.5475, lon: -3.64209)
//        let city5 = LocationCitiesModel(id: 2,nameCity: "Alameda de Osuna", lat: 40.4474, lon: -3.6099)
//        let city6 = LocationCitiesModel(id: 3,nameCity: "Lima", lat: -12.0453, lon: -77.0311)
//        let city7 = LocationCitiesModel(id: 3,nameCity: "New York", lat: 40.6643, lon: -73.9385)
//        var listStruct : [LocationCitiesModel] = []
//        listStruct.append(city1)
//        listStruct.append(city2)
//        listStruct.append(city3)
//        listStruct.append(city4)
//        listStruct.append(city5)
//        listStruct.append(city6)
//        listStruct.append(city7)
//        var cityResult = LocationCitiesModel(id: 0, nameCity: "", lat: 0, lon: 0)
//        
//        for elem in listStruct {
//            if elem.nameCity == nameCity {
//                cityResult =  LocationCitiesModel(id: elem.id, nameCity: elem.nameCity, lat: elem.lat, lon: elem.lon)
//            }
//        }
//        return Just([cityResult]).setFailureType(to: HttpError.self).eraseToAnyPublisher()
//    }
//    }
