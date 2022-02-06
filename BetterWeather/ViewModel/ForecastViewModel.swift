//
//  ForecastViewModel.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-22.
//

import SwiftUI

class ForecastViewModel: ObservableObject {
    @AppStorage(AppStorageKeys.storedLat.rawValue) var storedLat = "0"
    @AppStorage(AppStorageKeys.storedLong.rawValue) var storedLong = "0"
    @AppStorage(AppStorageKeys.storedUnits.rawValue) var storedUnits = "metric"
    @AppStorage(AppStorageKeys.storedAPIKey.rawValue) var apiKey = ""

    @State var currentStatus: CurrentStatus = .none

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

    init() {
        currentStatus = .fetchingStarted
        fetchForecast()
        currentStatus = .fetchingEnded
    }

    func fetchForecast() {

        /*        Might migrate to Async Await in the future using
         let (data, response) = try await URLSession.shared.data(from: url)
         */

        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(storedLat)&lon=\(storedLong)&appid=\(apiKey)&units=\(storedUnits)&units=metric") else {return}
//        let url = URL(string: "http://192.168.2.23:8000/test.json")!

        print(url)
        URLSession.shared.dataTask(with: url) { data, response, error in

            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                DispatchQueue.main.sync {
                    self.currentStatus = .fetchingResponseError
                }
                return
            }

            if let error = error {
                self.currentStatus = .fetchingFailed
                print(error.localizedDescription)
            }

            if let data = data {
                DispatchQueue.main.sync {
                    do {
                        self.currentStatus = .decodingJson
                        self.forecast = try JSONDecoder().decode(ForecastModel.self, from: data)
                        self.currentStatus = .decodingSuccess
                    } catch let DecodingError.dataCorrupted(context) {
                        print(context)
                    } catch let DecodingError.keyNotFound(key, context) {
                        print("Key '\(key)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch let DecodingError.valueNotFound(value, context) {
                        print("Value '\(value)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch let DecodingError.typeMismatch(type, context) {
                        print("Type '\(type)' mismatch:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch {
                        self.currentStatus = .decodingFailed
                        print(error.localizedDescription)
                    }
                }
            }
        }.resume()
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
