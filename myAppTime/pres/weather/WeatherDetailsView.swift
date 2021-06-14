//
//  WeatherDetails.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 1/6/21.
//

import SwiftUI

private  let defaultIcon = "􀅍"
private let iconMap = [
    "Drizzle" :  "cloud.drizzle",
    "Thunderstorm" : "cloud.bolt",
    "Rain" : "cloud.rain",
    "Snow" : "snow",
    "Clear" : "sun.max",
    "Clouds" : "cloud"
]

struct WeatherDetailsView: View {
    
    @ObservedObject var weatherListViewModel =  WeatherListViewModel()
    
    @ObservedObject var weatherInfo : WeatherViewModel
    @ObservedObject var location : LocationViewModel
    
    @State private var isExpanded =  false
    
    var body: some View {
        
        
        VStack(alignment: .center) { //VStack principal
            
            
            VStack(alignment: .center) {
                Text("\(location.nameCity)")
                    .font(.largeTitle)
                    .padding()
                
                Text("\(Int(weatherInfo.mainInfo.temp - 273.15))ºC")
                    .font(.system(size: 70))
                    .padding()
                Image(systemName: iconMap[weatherInfo.weatherStruct[0].main] ?? defaultIcon )
                    .font(.largeTitle)
                    .padding()
                Text(" \(weatherInfo.weatherStruct[0].description.capitalized)")
                
            } //fin 1º Vstack elem
            .navigationBarTitle(Text("WeatherApp"))
            //.background(Color.green)
            .padding(20)
            
            
            VStack {
                List {
                    Section(header: Text("Main info"), footer:Text("")) {
                        Text("temp_max: \(Int(weatherInfo.mainInfo.temp_max - 273.15))ºC")
                        Text("temp_min: \(Int(weatherInfo.mainInfo.temp_min - 273.15))ºC")
                        Text("Humidity: \(weatherInfo.mainInfo.humidity)")
                        Text("Humidity: \(weatherInfo.mainInfo.pressure)")
                        Text("grnd_level: \(weatherInfo.mainInfo.grnd_level)")
                        Text("sea_level: \(weatherInfo.mainInfo.sea_level)")
                        
                    }
                    Section(header: Text("Wind info"), footer:Text("")) {
                        Text("deg: \(weatherInfo.windInfo.deg) º")
                        Text("gust: \(weatherInfo.windInfo.gust)")
                        Text("speed: \(weatherInfo.windInfo.speed)")
                    }
                    
                } //fin List
            }//fin 2º Vstack elem
            .padding(10)
            //.background(Color.red)
        }// fin Vstack principal
        
    }
}

struct WeatherDetails_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
