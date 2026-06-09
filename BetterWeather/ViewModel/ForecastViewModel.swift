//
//  ForecastViewModel.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-22.
//

import os
import SwiftUI

@MainActor
final class ForecastViewModel: ObservableObject {
    @AppStorage(AppStorageKeys.storedLat.rawValue) var storedLat = "0"
    @AppStorage(AppStorageKeys.storedLong.rawValue) var storedLong = "0"
    @AppStorage(AppStorageKeys.storedUnits.rawValue) var storedUnits = "metric"
    @AppStorage(AppStorageKeys.storedAPIKey.rawValue) var apiKey = ""

    @Published var currentStatus: CurrentStatus = .none

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
        daily: [exampleDailyModel], alerts: [WeatherAlertModel]()
    )

    private static let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier ?? "com.aayush.opensource.BetterWeather",
        category: "Forecast"
    )

    private var hasLoadedForecast = false

    func task() async {
        guard !hasLoadedForecast else { return }
        hasLoadedForecast = true
        await fetchForecast()
    }

    func fetchForecast() async {
        currentStatus = .fetchingStarted

        guard let url = ForecastRequest(
            lat: storedLat,
            lon: storedLong,
            apiKey: apiKey,
            units: storedUnits
        ).url else {
            currentStatus = .unknownError
            return
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                currentStatus = .fetchingResponseError
                return
            }

            currentStatus = .decodingJson
            forecast = try JSONDecoder().decode(ForecastModel.self, from: data)
            currentStatus = .decodingSuccess
        } catch let error as DecodingError {
            currentStatus = .decodingFailed
            Self.logger.error("Forecast decoding failed: \(String(describing: error), privacy: .public)")
        } catch {
            currentStatus = .fetchingFailed
            Self.logger.error("Forecast request failed: \(error.localizedDescription, privacy: .public)")
        }
    }
}

struct ForecastRequest: Equatable {
    var lat: String
    var lon: String
    var apiKey: String
    var units: String

    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.openweathermap.org"
        components.path = "/data/2.5/onecall"
        components.queryItems = [
            URLQueryItem(name: "lat", value: lat),
            URLQueryItem(name: "lon", value: lon),
            URLQueryItem(name: "appid", value: apiKey),
            URLQueryItem(name: "units", value: units)
        ]
        return components.url
    }
}

extension ForecastViewModel {
    enum CurrentStatus: String {
        case none = "Nothing has happened yet"
        case start = "init() has begun"

        case gettingLocation = "Getting user location"
        case locationGot = "We got the location"
        case locationPermission = "User didn't allow access to location and services"
        case locationError = "Couldn't find user's location"

        case fetchingStarted = "Fetching current Forecast"
        case fetchingResponseError = "We didn't get 200 OK"
        case fetchingSuccess = "Woo! Seems like we got current weather data"
        case fetchingFailed = "Error fetching current weather data"
        case fetchingEnded = "Fetching ended."

        case decodingJson = "Decoding the data we got"
        case decodingSuccess = "Data decoded successful"
        case decodingFailed = "Data decoding was unsuccessful"

        case networkError = "User is not connected to the network"
        case unknownError = "This is weird, Please file a bug report we'll sort this out asap."
    }
}
