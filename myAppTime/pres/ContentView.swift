//
//  ContentView.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 25/5/21.
//

import SwiftUI

struct ContentView: View {
    
    
    //instacio un objeto de la class WeatherListViewModel
    @ObservedObject var weatherListViewModel = WeatherListViewModel()
    @ObservedObject var locationListViewModel = LocationListViewModel()
    
 
    @State var name_city: String = ""
    
    
    
    //Otro modo de hacerlo
    //@State private var results = [WeatherListStruct]()
    
    var body: some View {
        NavigationView {
//            List {
//                ForEach(weatherListViewModel.weathers, id: \.id) { item in
//                    Text(item.description)
//                }
//            }
            
            List {
                ForEach(locationListViewModel.locations, id: \.id) { item in
                    HStack{
                        Text(item.nameCity)
                        Text("lat: \(item.lat)")
                        Text("lon: \(item.lon)")
                    }
                }
            }
        }.onAppear {
            locationListViewModel.fecthLocation()
        }
//            VStack{
//                HStack{
//                    TextField("Enter name city", text: $viewLocation.searchText)
//                        .padding(.horizontal, 40)
//                        .frame(width: UIScreen.main.bounds.width - 110, height: 45, alignment: .leading)
//                        .background(Color(#colorLiteral(red: 0.9294475317, green: 0.9239223003, blue: 0.9336946607, alpha: 1)))
//                        .clipped()
//                        .cornerRadius(10)
//                        .overlay(
//                            HStack {
//                                Image(systemName: "magnifyingglass")
//                                    .foregroundColor(.gray)
//                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
//                                    .padding(.leading, 16)
//                            }
//                        )
//                    //Spacer()
//                }.padding().padding(.top, 30)
//
//                List{
//                    VStack{
//                    NavigationLink(
//                        destination: WeatherDays()) {
//
//                        HStack{
//                            Image("alamedaosuna")
//                                .resizable()
//                                .frame(width: 50, height: 50)
//                                .clipShape(Circle())
//                                .overlay(Circle().stroke(Color.red,lineWidth: 2))
//                                .shadow(radius: 10)
//                                .padding(.trailing)
//                            HStack{
//                                VStack{
//                                    Text("Alameda de Osuna")
//                                    Text("lat: 40.4474")
//
//                                    Text("lon: -3.6099")
//
//                                }
//
//                                Spacer()
//                                VStack{
//                                    Text("ES")
//                                    Image("spain")
//                                        .resizable()
//                                        .frame(width: 30, height: 30)
//                                        .clipShape(Circle())
//                                        .overlay(Circle().stroke(Color.red,lineWidth: 2))
//                                        .shadow(radius: 10)
//                                        .padding(.trailing)
//                                }
//                            }
//                        }
//                    }//Fin navigation link 1
//
//                        Spacer()
//                        NavigationLink(destination: WeatherDays()) {
//                        HStack{
//                            Image("alamedaosuna")
//                                .resizable()
//                                .frame(width: 50, height: 50)
//                                .clipShape(Circle())
//                                .overlay(Circle().stroke(Color.red,lineWidth: 2))
//                                .shadow(radius: 10)
//                                .padding(.trailing)
//                            HStack{
//                                VStack{
//                                    Text("Alameda de Osuna")
//
//
//                                }
//
//
//                                VStack{
//                                    Text("ES")
//                                    Image("spain")
//                                        .resizable()
//                                        .frame(width: 30, height: 30)
//                                        .clipShape(Circle())
//                                        .overlay(Circle().stroke(Color.red,lineWidth: 2))
//                                        .shadow(radius: 10)
//                                        .padding(.trailing)
//                                }
//                            }
//                        }
//                        }//fin navigation link 2
//
//                    }//fin Vstack
//
//                }.navigationBarTitle("MyAppTime", displayMode: .inline)//Fin list 1º elemento del NavigationView
//
//            }
//
//
//
//        }//Fin NavigationView
        
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
