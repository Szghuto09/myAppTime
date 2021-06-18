//
//  LocationUseCase.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 15/6/21.
//

import Foundation
import Combine

protocol LocationUseCase {
    func getLocation(nameCity: String) -> AnyPublisher<[LocationCitiesModelDomain], DomainError>
}

class LocationUseCaseImpl : LocationUseCase {
    
    //declaro objeto API
    private let locationApi : LocationApi
    
    
    init() {
        //instacio la API
        self.locationApi = LocationApiImpl()
    }
    
    func getLocation(nameCity: String) -> AnyPublisher<[LocationCitiesModelDomain], DomainError> {
        
        print("LocationUseCase: \(locationApi.getLocation(nameCity: nameCity))")
        
        return locationApi.getLocation(nameCity: nameCity)
            //result ==  LocationCitiesModel
            .map { result -> [LocationCitiesModelDomain] in
                print("result : \(result)")
                var listLocationDomain : [LocationCitiesModelDomain] = []
                result.geonames?.forEach { item in
                    listLocationDomain.append(LocationCitiesModelDomain(id: item.geonameId, nameCity: item.name,countryCode: item.countryCode, lat: Double(item.lat)!, lon: Double(item.lng)!))
                }
                print("listLocationDomain: \(listLocationDomain.count)")
                return listLocationDomain
            }
            .mapError { error -> DomainError in
                .network(error: error)
            }.eraseToAnyPublisher()
        
    }
    
    
}
