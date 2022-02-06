//
//  HourlyForecastView.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-21.
//

import SwiftUI

struct HourlyForecastView: View {
    let hourly: [CurrentModel]

    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(hourly, id: \ .self) { hour in
                    HourlyForecaseDetail(hour: hour)
                        .padding(10)
                }
            }
            .padding()
        }
    }
}

struct HourlyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastView(hourly: exampleForecastModel.hourly)
            .preferredColorScheme(.dark)
    }
}
