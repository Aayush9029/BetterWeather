//
//  MainTitleView.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-21.
//

import SwiftUI


struct MainTitleView: View {
    let city: String
    let currentTemp: String
    let main: String
    let tempMin: String
    let tempMax: String
    
    var body: some View {
        VStack{
            Text(city)
                .font(.title).bold()
                .foregroundStyle(.secondary)
                .shadow(radius: 5)
            Text("\(currentTemp)°")
                .font(.system(size:128).bold())
                .foregroundStyle(.primary)
                .shadow(radius: 10)
            
            Text(main)
                .font(.title).bold()
                .foregroundStyle(.tertiary)
                .shadow(radius: 5)
            
            Text("H:\(tempMax)° L:\(tempMin)°")
                .font(.title).bold()
                .foregroundStyle(.secondary)
                .shadow(radius: 5)
            
        }
        .padding(.top)
    }
}


struct MainTitleView_Previews: PreviewProvider {
    static var previews: some View {
        MainTitleView(
            city: "Mississaugua",
            currentTemp: "15",
            main: "Rain",
            tempMin: "15",
            tempMax: "28"
        )
    }
}
