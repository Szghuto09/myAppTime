//
//  LocationApi.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 2/6/21.
//

import Foundation
import Combine


protocol LocationApi {

    func getLocation() -> AnyPublisher<[LocationCitiesModel],HttpError>
    func getLocation(nameCity: String) -> AnyPublisher<[LocationCitiesModel],HttpError>
    //func getCities(name:String) -> [String]
}

class LocationApiMock: HttpApiRequest<[LocationCitiesModel]>, LocationApi {
    
    
    
     //URl base del servidor
    //private var urlServer : String

//    init(urlServer: String){
//        self.urlServer = urlServer
//    }
    override init(){
        
    }

    //getLocation devuelve una lista de objetos struct LocationCitiesModel
    func getLocation() -> AnyPublisher<[LocationCitiesModel],HttpError> {
        
        let city1  = LocationCitiesModel(id: 0,nameCity: "Madrid", lat: -3.70325, lon: 40.4167)
        let city2 = LocationCitiesModel(id: 1,nameCity: "Alcorcon", lat: 40.34582, lon: -3.82487)
        let city3 = LocationCitiesModel(id: 2,nameCity: "Alcobendas", lat: 40.5475, lon: -3.64209)
        
        
        return Just([city1,city2,city3]).setFailureType(to: HttpError.self).eraseToAnyPublisher()
    }
    
    func getLocation(nameCity: String) -> AnyPublisher<[LocationCitiesModel], HttpError> {
        
        let city1  = LocationCitiesModel(id: 0,nameCity: "Madrid", lat: -3.70325, lon: 40.4167)
        let city2 = LocationCitiesModel(id: 1,nameCity: "Alcorcon", lat: 40.34582, lon: -3.82487)
        let city3 = LocationCitiesModel(id: 2,nameCity: "Alcobendas", lat: 40.5475, lon: -3.64209)
        let city4 = LocationCitiesModel(id: 2,nameCity: "Alcala de Henares", lat: 40.5475, lon: -3.64209)
        let city5 = LocationCitiesModel(id: 2,nameCity: "Alameda de Osuna", lat: 40.4474, lon: -3.6099)
        
        var list_struct : [LocationCitiesModel] = []
        list_struct.append(city1)
        list_struct.append(city2)
        list_struct.append(city3)
        list_struct.append(city4)
        list_struct.append(city5)
        
         var cityResult = LocationCitiesModel(id: 0, nameCity: "", lat: 0, lon: 0)
    
        
        for i in list_struct {
            if( i.nameCity == nameCity) {
                cityResult =  LocationCitiesModel(id: i.id, nameCity: i.nameCity, lat: i.lat, lon: i.lon)
            } 
        }
        
        return Just([cityResult]).setFailureType(to: HttpError.self).eraseToAnyPublisher()
        
    }

    }


