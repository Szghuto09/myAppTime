//
//  WeatherDayTime.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 1/6/21.
//

import SwiftUI

struct WeatherDayTime: View {
    var body: some View {
        NavigationView {
            VStack{
            Text("Seleccione Hora:")
                List{
                    NavigationLink(
                        destination: Text("Vista WeatherDetails")) {
                        VStack{
                            Text("12:00:00")
                            //                     Text("15:00:00")
                            //                     Text("18:00:00")
                            //                     Text("21:00:00")
                          
                        }
                    }
                    
                }
              
            }
        }
    }
}

struct WeatherDayTime_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDayTime()
    }
}
