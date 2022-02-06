//
//  DailyModel.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-22.
//

import Foundation

// MARK: - Daily
struct DailyModel: Codable, Hashable {

    let dt, sunrise, sunset, moonrise: Int
    let moonset: Int
    let moonPhase: Double
    let temp: Temp
    let feelsLike: FeelsLike
    let pressure, humidity: Int
    let dewPoint, windSpeed: Double
    let windDeg: Int
    let windGust: Double
    let weather: [WeatherModel]
    let clouds: Int
    let pop, uvi: Double
    let rain, snow: Double?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, moonrise, moonset
        case moonPhase  = "moon_phase"
        case temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, clouds, pop, uvi, rain, snow
    }

}

// MARK: - FeelsLike
struct FeelsLike: Codable, Hashable {
    let day, night, eve, morn: Double
}

// MARK: - Temp
struct Temp: Codable, Hashable {
    let day, min, max, night: Double
    let eve, morn: Double
}

let exampleDailyModel =  DailyModel(
    dt: 1634925600,
    sunrise: 1634925600,
    sunset: 1634925600,
    moonrise: 1634925600,
    moonset: 1634925600,
    moonPhase: 1634925600,
    temp:
        Temp(
            day: 0.0,
            min: 0.0,
            max: 0.0,
            night: 0.0,
            eve: 0.0,
            morn: 0.0
        ),
    feelsLike:
        FeelsLike(
            day: 0.0,
            night: 0.0,
            eve: 0.0,
            morn: 0.0
        ),
    pressure: 0,
    humidity: 0,
    dewPoint: 0.0,
    windSpeed: 0.0,
    windDeg: 0,
    windGust: 0,
    weather: [exampleWeatherModel],
    clouds: 0,
    pop: 0.0,
    uvi: 0,
    rain: 0.0,
    snow: 0.0
)
