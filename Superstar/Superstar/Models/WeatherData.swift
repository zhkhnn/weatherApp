//
//  WeatherData.swift
//  Superstar
//
//  Created by Aruzhan Zhakhan on 09.11.2022.
//

import Foundation
struct WeatherData: Decodable{
    
    let weather: [Weather]
    let name: String
    let main: MainData
}
struct Weather: Decodable{
    let id: Int
    let main: String
    let description: String
}
struct MainData: Decodable{
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}
