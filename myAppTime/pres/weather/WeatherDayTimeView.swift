//
//  WeatherDayTime.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 1/6/21.
//

import SwiftUI

private  let defaultIcon = "􀅍"
private let iconMapCountry = [
    "ES" :  "spain",
    "CL" : "chile",
    "CO" : "colombia",
    "PH" : "filipinas",
    "US" : "eu",
    "MX" : "mexico",
    "AR" : "argentina",
    "GQ" : "guineaEcuatorial",
    "ZA" : "sudafrica",
    "SE" : "sweden",
    "PR" : "puertoRico",
    "DO" : "republicaDominicana",
    "CU" : "cuba",
    "PY" : "paraguay",
    "UZ" : "uzbekistan",
    "NZ" : "newZealand",
    "CA" : "canada",
    "PE" : "peru"
]

struct WeatherDayTimeView: View {
    //location puedes ser tanto para locationActual o un item
    @ObservedObject var location : LocationViewModel  
    @ObservedObject var weatherListViewModel : WeatherListViewModel   //para usar getWeather
    
    
    
    var body: some View {
        ZStack {
            // NavigationView {
            VStack(alignment: .center, spacing:10) { //Vstack Principal
                
                VStack(alignment: .center) {
                    HStack {
                        Image(iconMapCountry[location.countryCode] ?? defaultIcon)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.red,lineWidth: 2))
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .padding(.horizontal)
                        VStack(alignment: .leading, spacing: 5) {
                            Text(location.nameCity).bold()
                            Text("lat: \(location.location.lat)")
                                .foregroundColor(.gray)
                                .fontWeight(.regular)
                                .font(.caption)
                            Text("lon: \(location.location.lon)")
                                .foregroundColor(.gray)
                                .fontWeight(.regular)
                                .font(.caption)
                        }
                    }
                }
                .padding(20)
                VStack { // Para la List
                    List {
                        Text("Días disponibles con información del clima")
                        
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
            //.navigationTitle("WeatherApp")
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
