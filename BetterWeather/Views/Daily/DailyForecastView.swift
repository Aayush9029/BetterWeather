//
//  DailyForecastView.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-21.
//

import SwiftUI

struct DailyForecastView: View {
    let columns = [
        GridItem(.adaptive(minimum: 420))
    ]
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns){
                    ForEach(1...7, id:\ .self){ time in
                        
                        DailyForecastDetail(
                            temp: 23,
                            tempMin: 16,
                            tempMax: 28,
                            pressure: 10002,
                            humidity: 41,
                            dewPoint: 286.19,
                            windSpeed: 3.83,
                            main: "Sunny",
                            sunRise: 1634819136,
                            sunSet: 1634859332,
                            day: "Friday"
                        )
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

struct DailyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastView()
            .preferredColorScheme(.dark)
.previewInterfaceOrientation(.landscapeLeft)
    }
}
