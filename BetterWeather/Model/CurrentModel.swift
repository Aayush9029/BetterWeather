//
//  CurrentModel.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-22.
//

import Foundation

// MARK: - Current
struct CurrentModel: Codable, Hashable {
    let dt: Int
    let sunrise, sunset: Int?
    let temp, feelsLike: Double
    let pressure, humidity: Int
    let dewPoint, uvi: Double
    let clouds, visibility: Int
    let windSpeed: Double
    let windDeg: Int
    let windGust: Double?
    let weather: [WeatherModel]
    let pop: Double?
    let rain: Rain?
    let snow: Double?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, pop, rain, snow
    }
}

// MARK: - Rain
struct Rain: Codable, Hashable {
    let the1H: Double

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }
}
