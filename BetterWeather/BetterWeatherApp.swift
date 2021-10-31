//
//  BetterWeatherApp.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-21.
//

import SwiftUI

@main
struct BetterWeatherApp: App {
    @StateObject var forecaseViewModel = ForecastViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(forecaseViewModel)
                .statusBar(hidden: true)
        }
    }
}
