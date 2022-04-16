//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Omar Ahmed on 16/04/2022.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weatherInfo = ""
    
    private let weatherService = OpenWeatherMapController()
        
    func fetch(city: String) {
        weatherService.fetchWeatherData(for: city, completionHandler: { (info, error) in
            guard error == nil,
                let weatherInfo = info else {
                    DispatchQueue.main.async {
                        self.weatherInfo = "Could not retrieve weather information for \(city)"
                    }
                return
            }
            DispatchQueue.main.async {
                self.weatherInfo = weatherInfo
            }
        })
    }
}
