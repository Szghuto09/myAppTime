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

    var body: some View {
        VStack(alignment: .center){
            Text("\(location.nameCity)")
                .font(.largeTitle)
                .padding()
           
            Text("\(Int(weatherInfo.mainInfo.temp - 273.15))ºC")
                .font(.system(size: 70))
                .padding()
            
            Text(" \(weatherInfo.weatherStruct[0].description.capitalized)")
                .font(.subheadline)
        }
     
    }
}

struct WeatherDetails_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
