//
//  MainTitleView.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-21.
//

import SwiftUI

struct MainTitleView: View {
    @AppStorage(AppStorageKeys.storedCity.rawValue) var storedCity = ""
    let current: CurrentModel

    var body: some View {
        VStack {
            Text(storedCity)
                .font(.title).bold()
                .foregroundStyle(.tertiary)
                .shadow(radius: 5)

            Text(String(format: "%.0f°", current.temp))
                .font(.system(size: 128).bold())
                .foregroundStyle(.primary)
                .shadow(color: .black.opacity(0.25), radius: 10)

            Text(current.weather.first?.weatherDescription ?? "...")
                .font(.title).bold()
                .foregroundStyle(.secondary)
                .shadow(radius: 5)
        }
    }
}

struct MainTitleView_Previews: PreviewProvider {
    static var previews: some View {
        MainTitleView(current: exampleForecastModel.current)
    }
}
