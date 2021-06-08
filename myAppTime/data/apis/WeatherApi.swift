//
//  WeatherApi.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 28/5/21.
//

import Foundation
import Combine

protocol WeatherApi {
    func getWeather(location: Location) -> AnyPublisher<WeatherList,HttpError>
}


class WeatherApiImpl: HttpApiRequest<WeatherList>, WeatherApi {
    
    private let baseUrl: String
    //Constructor
    override init() {
        
        self.baseUrl = "http://api.openweathermap.org/data/2.5/forecast?appid=828971f619b9ba9b1632c23dff01bec5"
    }
    
    
    func getWeather(location: Location) -> AnyPublisher<WeatherList, HttpError> {
        //devuelve 1 - objeto WeatherList
        perfromRequest(method: "GET", path: baseUrl + "&lat=\(location.lat)&lon=\(location.lon)", body: nil)

        
    }
}
