//
//  HourlyForecastView.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-21.
//

import SwiftUI

struct HourlyForecastView: View {
    
    let columns = [
        GridItem(.adaptive(minimum: 128))
        
    ]
    var body: some View {
        
        LazyVGrid(columns: columns){
            ForEach(5...12, id:\ .self){ time in
                
                HourlyForecaseDetail(time: "\(time)PM", icon: "sun.max.fill", title: "98°", description: "Sunny", shadowColor: .yellow)
                    .padding()
            }
        }
        .padding(.horizontal)
    }
}

struct HourlyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastView()
            .preferredColorScheme(.dark)
    }
}
