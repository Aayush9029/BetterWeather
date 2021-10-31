//
//  WeatherModel.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-22.
//

import Foundation

// MARK: - ForecastModel
struct ForecastModel: Codable {
    let lat, lon: Double
    let timezone: String
    let timezoneOffset: Int
    let current: CurrentModel
    let minutely: [MinutelyModel]
    let hourly: [CurrentModel]
    let daily: [DailyModel]

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, minutely, hourly, daily
    }
}

let exampleForecastModel =  ForecastModel(
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
            weather: [WeatherModel](),
            pop: 0.0,
            rain: Rain(the1H: 0.1), snow: 0.0),
    minutely: [MinutelyModel](),
    hourly: [CurrentModel](),
    daily: [DailyModel]())
