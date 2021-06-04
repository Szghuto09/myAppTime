//
//  WeatherDetails.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 1/6/21.
//

import SwiftUI

struct WeatherDetails: View {
    
    @ObservedObject var weatherInfo : WeatherViewModel
    @ObservedObject var location : LocationViewModel
    
    var body: some View {
        VStack{
        Text("Info Weather \(location.nameCity)")
            .font(.headline)
            .bold()
        
        }
        
        VStack{
            Text("main: \(weatherInfo.weatherStruct[0].description)")
                .font(.headline)
            Text("description: \(weatherInfo.weatherStruct[0].description)")
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
        }
    
        
            }
}

struct WeatherDetails_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
