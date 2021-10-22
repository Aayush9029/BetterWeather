//
//  ForecastViewModel.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-22.
//

import SwiftUI

class ForecastViewModel: ObservableObject{
    @Published var forecast: ForecastModel = ForecastModel(
        lat: 0,
        lon: 0,
        timezone: "America",
        timezoneOffset: 0,
        current:
            CurrentModel(
                dt: 0,
                sunrise: 0,
                sunset: 0,
                temp: 0.0,
                feelsLike: 0.0,
                pressure: 0,
                humidity: 0,
                dewPoint: 0,
                uvi: 0.0,
                clouds: 0,
                visibility: 0,
                windSpeed: 0.0,
                windDeg: 0,
                windGust: 0.0,
                weather: [exampleWeatherModel],
                pop: 0.0,
                rain: Rain(the1H: 0.1), snow: 0.0),
        minutely: [MinutelyModel](),
        hourly: [CurrentModel](),
        daily: [exampleDailyModel]
    )
    
    init(){
        print("fetching forecast")
        fetchForecast()
    }
    
    func fetchForecast(){
        //        units=imperial
        //        units=metric
        //    https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&appid=bc491408821cc43317006173fd1c5bef
        guard let url = URL(string: "http://192.168.2.23:8000/test.json") else {fatalError("INVALID URL") /*return*/}
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                DispatchQueue.main.sync {
                    do {
                        self.forecast = try JSONDecoder().decode(ForecastModel.self, from: data)
                        print(self.forecast)
                    }   catch{
                        print(error)
                    }
                }
            }
        }.resume()
    }
}

