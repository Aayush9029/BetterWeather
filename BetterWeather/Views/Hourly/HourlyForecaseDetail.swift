//
//  GlassboxView.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-21.
//

import SwiftUI

struct HourlyForecaseDetail: View {
    let time: String
    var icon: String
    var title: String
    var description: String
    var shadowColor: Color
    
    var body: some View{
        VStack{
            Text(time)
                .font(.title2.bold())
                .font(.subheadline)
                .foregroundColor(.primary)
                .padding(5)
            Image(systemName: icon)
                .resizable()
                .foregroundColor(shadowColor)
                .frame(width: 50, height: 50, alignment: .center)
                .cornerRadius(5)
                .shadow(color: shadowColor, radius: 50)
                .padding(.bottom)
            Divider()
            Text(title)
                .font(.title3)
                .foregroundColor(.primary)
            Text(description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
        }
        .frame(width: 128, height: 200)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.linearGradient(.init(colors: [
                    shadowColor,
                    .purple.opacity(0.5),
                    .clear,
                    .clear,
                    .red.opacity(0.5)
                ]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5)
        )
        .padding(.vertical, 5)
        .clipped()
        .shadow(color: .black.opacity(0.15), radius: 25, x: 0, y: 25)
        
    }
}
struct HourlyForecaseDetail_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecaseDetail(time: "12PM", icon: "sun.max.fill", title: "98°", description: "Sunny ", shadowColor: .yellow)
            .preferredColorScheme(.dark)
    }
}
