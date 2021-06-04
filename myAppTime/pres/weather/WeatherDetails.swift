//
//  WeatherDetails.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 1/6/21.
//

import SwiftUI

struct WeatherDetails: View {
    var body: some View {
        
        
      
            VStack{
                Text("Rain")
                    .font(.headline)
                    .bold()
                Text("light rain")
                    .font(.subheadline)
                
                Image("icon")
                    .resizable()
                    .frame(width: 130, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 20)
                    .animation(.easeInOut)
                    .padding()
                
                Button(action:{
                    //mostrar info del main: humidity, temp, etc....
                }){
                    Text ("Consultar main")
                }
                Button(action:{
                    //boton que muestra valores de speed deg gust
                    
                }){
                    Text ("Consultar wind")
                }
                
                }
              
        
       
        
            
     
        
            }
}

struct WeatherDetails_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetails()
    }
}
