//
//  ContentView.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var forecastVM: ForecastViewModel
    @EnvironmentObject var locationVM: LocationViewModel

    var body: some View {
        NavigationView {
            SideSettingsView()
                .environmentObject(locationVM)
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    MainTitleView(current: forecastVM.forecast.current)

                    SubHeadingView(title: "24 Hour Forecast")

                    HourlyForecastView(hourly: forecastVM.forecast.hourly)

                    BetterDivider()

                    SubHeadingView(title: "This Weeks Forecast")
                    DailyForecastView(daily: forecastVM.forecast.daily)

                    Spacer()
                }

            }
//            .background(
//                Image("clouds")
//                    .resizable()
//                    .scaledToFill()
//                    .ignoresSafeArea()
//        )

            .background(BackgroundGradient())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ForecastViewModel())
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}

struct SubHeadingView: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.title2.bold())
                .foregroundStyle(.tertiary)
            Spacer()
        }
        .padding(.leading)
    }
}

struct BetterDivider: View {
    var body: some View {
        Divider()
            .frame(height: 1)
            .background(.white.opacity(0.25))
            .padding()
    }
}
