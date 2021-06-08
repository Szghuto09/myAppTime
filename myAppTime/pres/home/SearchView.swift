//
//  SearchView.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 3/6/21.
//

import SwiftUI
import CoreLocation

struct SearchView: View { //View principal
    
    let layout = [
        GridItem(.flexible())
    ]
    
    @ObservedObject var locationListViewModel = LocationListViewModel()
    @ObservedObject var weatherListViewModel =  WeatherListViewModel()
    
     var locationActual = WeatherListViewModel().locationActualModel

    
    var body: some View {
        NavigationView{
            
            VStack(alignment: .center) {
        List {
            HStack{  //Solo contiene buscador
                TextField("Enter Search Text", text: $locationListViewModel.searchText)
                    .padding(.horizontal, 40)
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
                           
                            NavigationLink(destination: WeatherDayTimeView(location: item, weatherListViewModel: weatherListViewModel))
                            {
                                ItemView(item: item)
                            }
                        }
                    }
                }
            }//fin if
        }//Fin List
        .padding()
        .background(Color(#colorLiteral(red: 0.9758560663, green: 0.9758560663, blue: 0.9758560663, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("MyAppTime", displayMode: .inline)
                
                NavigationLink(destination: WeatherDayTimeView(location: locationActual, weatherListViewModel: weatherListViewModel)) {
                    VStack{
                        Button(action: weatherListViewModel.getActualLocation){
                            Text("Devolver clima actual")
                                .foregroundColor(.white)
                            
                        }.padding()
                        .background(Color.red)
                        .cornerRadius(10)
                        
                    }
                }//Fin NavigationLink
            } //Fin VStack
        }// Fin NavigationView
    }
}
    
struct ItemView: View {
    let item: LocationViewModel
    
    var body: some View {
        ZStack {
            HStack(spacing: 5) {
                RoundedRectangle(cornerRadius: 10, style: .circular)
                    .fill(Color.gray.opacity(0.4))
                    .frame(height: 80)
                    .frame(width: 70)
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

