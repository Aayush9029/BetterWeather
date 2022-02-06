//
//  WeatherModel.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-22.
//

import Foundation

// MARK: - WeatherModel
struct WeatherModel: Codable, Hashable {
    let id: Int
    let main: Main
    let weatherDescription: String?
    let icon: Icon?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

enum Icon: String, Codable {
    case the01d = "01d"
    case the01n = "01n"
    case the02d = "02d"
    case the02n = "02n"
    case the03d = "03d"
    case the03n = "03n"
    case the04d = "04d"
    case the04n = "04n"
    case the09d = "09d"
    case the09n = "09n"
    case the10d = "10d"
    case the10n = "10n"
    case the11d = "11d"
    case the11n = "11n"
    case the13d = "13d"
    case the13n = "13n"
    case the50d = "50d"
    case the50n = "50n"
}

enum Main: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
    case snow = "Snow"
    case mist = "Mist"
    case showerRain = "Shower rain"
    case thunderstorm = "Thunderstorm"
}

let exampleWeatherModel = WeatherModel(
    id: 0,
    main: .clear ,
    weatherDescription: "rainy",
    icon: .the01d
)

func weatherIconToSf(for icon: Icon) -> String {
    switch icon {
    case .the01d:
        return "sun.min.fill"
    case .the01n:
        return "moon.fill"
    case .the02d:
        return "cloud.sun.fill"
    case .the02n:
        return "cloud.sun"
    case .the03d:
        return "cloud.fill"
    case .the03n:
        return "cloud"
    case .the04d:
        return "smoke.fill"
    case .the04n:
        return "smoke"
    case .the09d:
        return "cloud.drizzle.fill"
    case .the09n:
        return "cloud.drizzle"
    case .the10d:
        return "cloud.rain.fill"
    case .the10n:
        return "cloud.rain"
    case .the11d:
        return "cloud.bolt.rain.fill"
    case .the11n:
        return "cloud.bolt.rain"
    case .the13d:
        return "cloud.snow.fill"
    case .the13n:
        return "cloud.snow"
    case .the50d:
        return "wind"
    case .the50n:
        return "wind.snow"
    }
}
