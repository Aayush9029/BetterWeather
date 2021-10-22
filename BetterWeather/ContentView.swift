//
//  ContentView.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                MainTitleView(
                    city: "Mississaugua",
                    currentTemp: "15",
                    main: "Sunny",
                    tempMin: "15",
                    tempMax: "28"
                )
                
                BetterDivider()
                
                SubHeadingView(title: "Todays Hourly Forecast")
                
                HourlyForecastView()
                
                BetterDivider()
                
                SubHeadingView(title: "This Weeks Forecast")
                
                DailyForecastView()
                
                
                Spacer()
            }
            
        }
        
        .background(
            Image("clouds")
                .resizable()
                .scaledToFill()
                .overlay(Color.black.opacity(0.5))
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
.previewInterfaceOrientation(.landscapeRight)
    }
}

struct SubHeadingView: View {
    let title: String
    var body: some View {
        HStack{
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
