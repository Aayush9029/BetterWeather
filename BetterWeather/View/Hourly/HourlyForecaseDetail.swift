//
//  GlassboxView.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-21.
//

import SwiftUI

struct HourlyForecaseDetail: View {
    let hour: CurrentModel
    let shadowColor = Color.white
    var body: some View {
        VStack {
            Text(epochToHour(for: hour.dt))
                .font(.title2.bold())
                .font(.subheadline)
                .foregroundColor(.primary)
                .padding(5)
            Image(systemName: weatherIconToSf(for: hour.weather.first?.icon ?? .the01d))
                .symbolVariant(.fill)
                .font(.largeTitle)
                .foregroundColor(shadowColor.opacity(0.5))
                .frame(height: 50, alignment: .center)
                .cornerRadius(5)
                .shadow(color: .black, radius: 50)
                .padding(.bottom)
            Divider()
            Text(String(format: "%.2f", hour.temp))
                .font(.title3)
                .foregroundColor(.primary)

            Text(hour.weather.first?.weatherDescription ?? "...")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
        }
        .frame(width: 128, height: 200)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.linearGradient(.init(colors: [
                    .teal,
                    .purple.opacity(0.5),
                    .clear,
                    .clear,
                    .red.opacity(0.5)
                ]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5)
        )
        .padding(.vertical, 5)
        .clipped()
        .shadow(color: .black.opacity(0.15), radius: 15, x: 0, y: 10)

    }
}
struct HourlyForecaseDetail_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecaseDetail(hour: exampleForecastModel.current)
    }
}
