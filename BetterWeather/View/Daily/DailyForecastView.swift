//
//  DailyForecastView.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-21.
//

import SwiftUI

struct DailyForecastView: View {
    let daily: [DailyModel]

    let columns = [
        GridItem(.adaptive(minimum: 420))
    ]
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(daily, id: \.self) { day in
                        DailyForecastDetail(day: day)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

struct DailyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastView(daily: exampleForecastModel.daily)
            .preferredColorScheme(.dark)
.previewInterfaceOrientation(.landscapeLeft)
    }
}
