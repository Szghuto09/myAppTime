//
//  SearchView.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 3/6/21.
//

import SwiftUI
import CoreLocation


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

struct SearchView: View { //View principal
    
    let layout = [
        GridItem(.flexible())
    ]
    
    @ObservedObject var locationListViewModel = LocationListViewModel()
    @ObservedObject var weatherListViewModel =  WeatherListViewModel()

    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .center) {
                List {
                    HStack {  //Solo contiene buscador
                        TextField("Enter Search Text", text: $locationListViewModel.searchText)
                            .foregroundColor(Color.black)
                            .padding(40)
                            .frame(width: UIScreen.main.bounds.width - 110, height: 45, alignment: .leading)
                            .background(Color(#colorLiteral(red: 0.9294475317, green: 0.9239223003, blue: 0.9336946607, alpha: 1)))
                            .clipped()
                            .cornerRadius(10)
                            .overlay(
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.gray)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 16)
                                }
                            )
                    }
                    
                    //El resto de filas con el contenido
                    if locationListViewModel.locationsFound.count > 0 {
                        ScrollView(showsIndicators: false) {
                            LazyVGrid(columns: layout, spacing: 12) {
                                ForEach(locationListViewModel.locationsFound, id: \.id) { item in
                                    NavigationLink(destination: WeatherDayTimeView(location: item, weatherListViewModel: weatherListViewModel)) {
                                        ItemView(item: item)
                                    }
                                }
                            }
                        }
                    }//fin if
                }//Fin List
                .padding()
                .navigationTitle("WeatherApp").foregroundColor(.pink)
                

                NavigationLink(destination: WeatherDayTimeView(location: weatherListViewModel.locationActual, weatherListViewModel: weatherListViewModel)) {
                        HStack {
                            Text("Info clima según GPS")
                                .font(.subheadline)
                                .bold()
                                .foregroundColor(Color.pink)
                                .padding(10)
                            
                            Image(systemName: "location")
                                .foregroundColor(Color.pink)
                                .shadow(radius: 20)
                                
                        }
                    }//Fin NavigationLink
            } //Fin VStack
            .onAppear(perform:weatherListViewModel.getActualLocation)
        }// Fin NavigationView
    }
}

struct ItemView: View {
    let item: LocationViewModel
    @ObservedObject var locationListViewModel = LocationListViewModel()
    
    var body: some View {
        ZStack {
            HStack(spacing: 5) {
                
                Image(iconMapCountry[item.countryCode] ?? defaultIcon)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.red,lineWidth: 2))
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(item.nameCity)
                        .font(.body)
                        .fontWeight(.semibold)
                    Text("lat:\(item.location.lat)")
                        .foregroundColor(.gray)
                        .fontWeight(.regular)
                        .font(.caption)
                    Text("lon:\(item.location.lon)")
                        .foregroundColor(.gray)
                        .fontWeight(.regular)
                        .font(.caption)
                }
                
                Spacer()
                
            }
            
        }
        .frame(height: 100)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.11), radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 7)
        )
        .padding(.horizontal, 10)
        .animation(.easeIn)
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
