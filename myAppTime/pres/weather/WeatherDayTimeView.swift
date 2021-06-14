//
//  WeatherDayTime.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 1/6/21.
//

import SwiftUI

private  let defaultIcon = "􀅍"
private let iconMapCountry = [
    "Madrid" :  "spain",
    "Alcorcon" :  "spain",
    "Alcala de Henares" :  "spain",
    "Alcobendas" :  "spain",
    "Alameda de Osuna" :  "spain",
    "Lima" : "peru",
    "New York" : "eu"
]

struct WeatherDayTimeView: View {
    
    @ObservedObject var location : LocationViewModel
    
    @ObservedObject var weatherListViewModel : WeatherListViewModel   //para usar getWeather
    var body: some View {
        ZStack {
            // NavigationView {
            VStack(alignment: .center, spacing:10) { //Vstack Principal
                VStack(alignment: .center) {
                    HStack {
                        Image(iconMapCountry[location.nameCity] ?? defaultIcon)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.red,lineWidth: 2))
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .padding(.horizontal)
                        Text(location.nameCity).bold()
                    }
                }
                .padding(20)
                VStack { // Para la List
                    List {
                        Text("Diás disponibles con información del clima")
                        ForEach(weatherListViewModel.listKeys, id: \.self) { elemt in // para las cabeceras
                            Section(header: Text(elemt)) {
                                ForEach(weatherListViewModel.hashMapListStruct[elemt]!, id: \.dt) { item  in  //
                                    NavigationLink(destination: WeatherDetailsView(weatherInfo: item, location: location)) {
                                        Text(item.dt_txt)
                                        
                                    }
                                }
                            }
                        }
                    }
                }
                //.background(Color.green)
                .padding(9)
                
            }//fin VStack  principal
            //.background(Color.pink)
            .navigationTitle("WeatherApp")
            .onAppear() {
                weatherListViewModel.fetchWeather(location: location.location)
            }
        }
        //  }//Fin NavigationView
        
    }
    
    struct WeatherDayTime_Previews: PreviewProvider {
        static var previews: some View {
            EmptyView()
        }
    }
}
