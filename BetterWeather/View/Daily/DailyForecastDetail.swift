//
//  GlassboxView.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-21.
//

import SwiftUI

struct DailyForecastDetail: View {
    let day: DailyModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(epochToDay(for: day.dt))
                .font(.title2.bold())
                .foregroundStyle(.primary)
                .padding(.leading)
            Divider()
            HStack {
                HStack {
                    Spacer()
                    DailyForecastSubDetail(detail: "\(day.temp.day)°", image: weatherIconToSf(for: day.weather.first?.icon ?? .the01d))

                    DailyForecastSubDetail(detail: "\(day.temp.max)°", image: "thermometer.sun")
                    DailyForecastSubDetail(detail: "\(day.temp.min)°", image: "thermometer.snowflake")

                    DailyForecastSubDetail(
                        detail: "\(day.humidity)%",
                        image: "humidity.fill"
                    )
                    DailyForecastSubDetail(
                        detail: String(format: "%.2f", day.dewPoint),
                        image: "drop.fill"
                    )
                    DailyForecastSubDetail(detail: String(format: "%.2f km", day.windSpeed), image: "wind", disableDivider: true)

                    Spacer()
                }
            }
        }
        .frame(height: 180)
        .padding()
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
    }
}
struct DailyForecastDetail_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastDetail(day: exampleDailyModel)
            .preferredColorScheme(.dark)
    }
}

struct DailyForecastSubDetail: View {
    let detail: String
    let image: String
    var disableDivider: Bool = false
    var body: some View {
        Group {
            HStack {
                VStack(alignment: .center) {
                    Image(systemName: image)
                        .font(.title.bold())
                        .foregroundStyle(.secondary)
                        .frame(height: 50)
                    Text(detail)
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.tertiary)
                }
                .frame(height: 120)
                if !disableDivider {
                    Spacer()
                    Divider()
                    Spacer()
                }
            }
        }
    }
}
