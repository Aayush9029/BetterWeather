//
//  GlassboxView.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-21.
//

import SwiftUI

struct DailyForecastDetail: View {
    let temp: Int
    let tempMin: Int
    let tempMax: Int
    let pressure: Int
    let humidity: Int
    let dewPoint: Double
    let windSpeed: Double
    let main: String
    let sunRise: Int
    let sunSet: Int
    let day: String
    
    var body: some View{
        VStack(alignment: .leading) {
            Text(day)
                .font(.title2.bold())
                .foregroundStyle(.primary)
                .padding()
            Divider()
            HStack {
                HStack{
                    
                    Spacer()
                    DailyForecastSubDetail(detail: "26°", image: "sun.max.fill")
                    DailyForecastSubDetail(detail: "H:\(tempMax)° L:\(tempMin)°", image: "thermometer")
                    
                    DailyForecastSubDetail(
                        detail:"\(humidity)%",
                        image: "aqi.low"
                    )
                    DailyForecastSubDetail(
                        detail: String(format: "%.2f", dewPoint),
                        image: "drop.fill"
                    )
                    DailyForecastSubDetail(detail: String(format: "%.2f km", windSpeed), image: "wind", disableDivider: true)
                    
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
                VStack(alignment: .center){
                    Image(systemName: image)
                        .font(.largeTitle.bold())
                        .foregroundStyle(.secondary)
                        .padding(5)
                    
                    Text(detail)
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.tertiary)
                }
                .frame(height: 120)
                if !disableDivider{
                    Spacer()
                    Divider()
                    Spacer()
                }
            }
        }
    }
}
