//
//  CustomAckLabelsView.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-31.
//

import SwiftUI

struct CustomAckLabels: View {
    let title: String
    let image: String
    let color: Color
    var body: some View {
        HStack {
            Text(title)
//            Label(title, systemImage: image)
//            Image(systemName: image)
//                .symbolVariant(.fill)
//                .foregroundColor(color)
//            Text(title)
        }
    }
}

struct CustomAckLabelsView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAckLabels(title: "Rate App", image: "star", color: .yellow)
    }
}
