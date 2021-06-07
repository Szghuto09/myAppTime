//
//  WeatherDetails.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 1/6/21.
//

import SwiftUI

struct WeatherDetailsView: View {
    
    @ObservedObject var weatherInfo : WeatherViewModel
    @ObservedObject var location : LocationViewModel
    
    //private var url = "http://openweathermap.org/img/wn/10d@2x.png"
    var url2 = "http://openweathermap.org/img/wn/"
    
    var body: some View {
        VStack{
            Text("Info Weather \(location.nameCity)")
                .font(.headline)
                .bold()
            
            Text("main: \(weatherInfo.weatherStruct[0].main)")
                .font(.subheadline)
         
            Text("description: \(weatherInfo.weatherStruct[0].description)")
                .font(.subheadline)
        }
     
    
        VStack{
            //Text("description: \(weatherInfo.weatherStruct[0].icon)")

            Image(systemName: "photo")
                .resizable()
                .frame(width: 130, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: .fit)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 20)
                .animation(.easeInOut)
                .padding()
        }//Fin VStack
    }
}

struct WeatherDetails_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
