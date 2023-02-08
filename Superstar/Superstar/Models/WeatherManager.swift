//
//  WeatherManager.swift
//  Superstar
//
//  Created by Aruzhan Zhakhan on 09.11.2022.
//

import Foundation

protocol WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager: WeatherManager, with model: WeatherModel)
    
    func didFailWithError(error: Error)
}

struct WeatherManager{
    
    var delegate: WeatherManagerDelegate?
    
    func fetchRequest(){
        let link = "https://api.openweathermap.org/data/2.5/weather?lat=51.5072&lon=-0.1276&units=metric&appid=79b480b8af4ee153439efed31452b1a7"
        guard let URL = URL(string: link) else{ return }
        let task = URLSession.shared.dataTask(with: URL){ data, response, error in
            if let data, error == nil{
                let decoder = JSONDecoder()
                do{
                    let decodedData = try decoder.decode(WeatherData.self, from: data)
                    let cityName = decodedData.name
                    let temp = decodedData.main.temp
                    let description = decodedData.weather[0].description
                    let highT = decodedData.main.temp_max
                    let lowT = decodedData.main.temp_min
                    print("\(cityName), \(temp),\(description),\(highT)")
                    let weatherModel = WeatherModel(cityName: cityName, temp: temp, description: description, highT: highT, lowT: lowT)
                    delegate?.didUpdateWeather(self, with: weatherModel)
                }
                catch{
                    print("Nothing has been decoded \(error)")
                    return
                }
            }
            else{
                print("Nothing has been retrieved \(String(describing: error))")
            }
        }
        task.resume()
    }
}
