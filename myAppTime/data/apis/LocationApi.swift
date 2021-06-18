//
//  LocationApi.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 15/6/21.
//

import Foundation
import Combine

protocol LocationApi {
    func getLocation (nameCity: String) -> AnyPublisher<LocationCitiesModel,HttpError>
}


class LocationApiImpl: HttpApiRequest<LocationCitiesModel>, LocationApi {
    
    
    private let baseUrl : String

    override init() {
        self.baseUrl = "http://api.geonames.org/searchJSON?username=edu39"
    }
    
    func getLocation(nameCity: String) -> AnyPublisher<LocationCitiesModel, HttpError> {
        perfromRequest(method: "GET", path: baseUrl + "&name=\(nameCity)" , body: nil)
    }
    
}
