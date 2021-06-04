//
//  ContentView.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 25/5/21.
//

import SwiftUI

struct ContentView: View {
    
    
    //instacio un objeto de la class WeatherListViewModel
    @ObservedObject var viewModel = WeatherListViewModel()
    
    
    
    //Otro modo de hacerlo
    //@State private var results = [WeatherListStruct]()
    
    var body: some View {
        
        NavigationView {
            
            List {
                ForEach(viewModel.weathers, id: \.id) { item in
                    Text(item.description )
                }
            }
            .onAppear {
                viewModel.fetchWeather()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
