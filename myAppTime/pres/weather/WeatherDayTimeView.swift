//
//  WeatherDayTime.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 1/6/21.
//

import SwiftUI

private var listDays = [ "2021-06-10",  "2021-06-11", "2021-06-12","2021-06-13","2021-06-14","2021-06-15"]

private  let defaultIcon = "􀅍"
private let iconMapCountry = [
    "Madrid" :  "spain",
    "Alcorcon" :  "spain",
    "Alcala de Henares" :  "spain",
    "Alcobendas" :  "spain",
    "Alameda de Osuna" :  "spain",
    "Lima" : "peru",
    "New York" : "eu",
]


struct WeatherDayTimeView: View {
    
    @ObservedObject var location : LocationViewModel
    
    @ObservedObject var weatherListViewModel : WeatherListViewModel   //para usar getWeather
    var body: some View {
        
        
        ZStack{
       // NavigationView {
            VStack(alignment: .center , spacing:10) { //Vstack Principal
                VStack(alignment: .center) {
                    HStack{
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
                //.background(Color.yellow)
                .padding(20) //se aleja del principal
                
                VStack { // Para la List
                    List{
                        Text("Diás disponibles con información del clima")
                        if weatherListViewModel.weathers.count > 0 {
                            ForEach(listDays, id: \.self) { i in
                                Section(header: Text(i)) {
                                    ForEach(weatherListViewModel.weathers, id: \.dt) { item  in
                                        if item.dt_txt.prefix(10) == i {
                                            NavigationLink(destination: WeatherDetailsView(weatherInfo: item, location: location))
                                                { Text(item.dt_txt) }
                                        }//fin if
                                    }//Fin ForEach
                                }//fin seccion
                            }
                        }//fin if
                    }//Fin List
                }
                //.background(Color.green)
                .padding(9)
                
            }//fin VStack  principal
            //.background(Color.pink)
            .navigationTitle("WeatherApp")
            .onAppear(){
                //mini-base de datos
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
