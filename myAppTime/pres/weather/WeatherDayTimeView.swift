//
//  WeatherDayTime.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 1/6/21.
//

import SwiftUI

struct WeatherDayTimeView: View {
    
    @ObservedObject var location : LocationViewModel
    
    @ObservedObject var weatherListViewModel : WeatherListViewModel   //para usar getWeather
    
    var body: some View {
        NavigationView {
            VStack{ //Vstack principal
                Text(location.nameCity)
                
                List{
                    Text("Seleccione Hora:")
                    //40
                    if weatherListViewModel.weathers.count > 0 {
                        ForEach(weatherListViewModel.weathers, id: \.dt) { item in
                            NavigationLink(destination: WeatherDetailsView(weatherInfo: item, location: location))
                            {
                                Text(item.dt_txt)
                            }
                        }
                    }
                }//Fin List
            }//Fin VStack
            .onAppear(){
                //mini-base de datos
                weatherListViewModel.fetchWeather(location: location.location)
            }
        }//Fin NavigationView
    }
    
    struct WeatherDayTime_Previews: PreviewProvider {
        static var previews: some View {
            EmptyView()
        }
    }
}
