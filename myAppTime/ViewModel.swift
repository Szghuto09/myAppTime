//
//  ViewModel.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 26/5/21.
//

import Foundation

//data needed by view

class WeatherViewModel: ObservableObject {
    
    
    //info coord
    @Published var lon: Float = 0
    @Published var lat: Float = 0
    
    //info weather
    @Published var description: String = "-"
    
    //info main
    @Published var temperatura: String = "-"
    @Published var pressure: Float = 0
    @Published var humidity: Float = 0

    
    //info wind
    @Published var speed: Float = 0
    
    
    //info zona
    @Published var country: String = "-"
    @Published var  timezone: Int = 0
    @Published var namezone: String = "-"
    
    
    init() {
        //Extrayendo datos de la API
        fetchWeather()
    }
    
    func fetchWeather() {
        
        let session = URLSession.shared
        //Peticion
        let s = "http://api.openweathermap.org/data/2.5/weather?lat=40.447428&lon=-3.609869&appid=828971f619b9ba9b1632c23dff01bec5"
        
        
        //Verifico la url
        guard let url = URL(string: s) else {
            print("URL incorrecto : \(s)")
            return
        }
        
        let task = session.dataTask(with: url) {
            (data, res, error) in
            
            if error != nil {
                print("Se ha producido un error...")
                return
            }
            
            if ( res as! HTTPURLResponse).statusCode != 200 {
                print("Se ha producido un error")
            }
            
//            print("*************DATA**************")
//            print(data!)
//            print("***************************")
            
            //print("*************STATUS*************")
            //print(res)
            //print("***************************")
            
            //Convert data to Model
            let decoder = JSONDecoder()
            
            do {
                
                let model = try decoder.decode(WeatherModel.self, from: data!)
                //print("\n")
                //print("*************MODEL*************")
                //print(model)
                //print("***************************")
                DispatchQueue.main.async {
                    
                    print("Entra aquí.....")
                    //info coordenadas
                    self.lon = model.coord.lon
                    self.lat = model.coord.lat
                    
                    //info weather
                    self.description = model.weather.first?.description ?? "No Description"
                    
                    //info main
                    self.temperatura =  "\(model.main.temp - 273.15)º"
                    self.pressure =  model.main.pressure
                    self.humidity = model.main.humidity
                    //info wind
                    self.speed = model.wind.speed
                    
                    //info de zona
                    self.country = model.sys.country
                    self.timezone = model.timezone
                    self.namezone = model.name
                }
            }
            catch{
                print("Se ha producido un error al decodificar")
            }
            
        }
        task.resume()
        
    }
    
    
}
