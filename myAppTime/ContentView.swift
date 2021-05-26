//
//  ContentView.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 25/5/21.
//

import SwiftUI

struct ContentView: View {
    
    // Declaras modelos
    //@StateObject necesario para crear un objeto dentro de una vista
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            
            VStack {
                HStack{
                    Text(viewModel.country)
                        .font(.system(size: 32))
                    Text(viewModel.namezone)
                        .font(.system(size: 32))
                }
                
               
                Text(viewModel.temperatura)
                    .font(.system(size: 44))
                Text(viewModel.description)
                    .font(.system(size: 32))
                
            }
            .navigationTitle("El Tiempo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
