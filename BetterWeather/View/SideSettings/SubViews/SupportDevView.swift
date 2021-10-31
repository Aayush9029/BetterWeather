//
//  SupportDevView.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-31.
//

import SwiftUI

struct SupportDevView: View {
    var body: some View {
        Section(
            header: CustomAckLabels(title: "Support Dev", image: "heart.fill", color: .pink)
        ) {
            Button {
            } label: {
                CustomAckLabels(title: "Rate App", image: "star", color: .yellow)
            }
            
            Button {
            } label: {
                CustomAckLabels(title: "Send thanks", image: "paperplane.fill", color: .blue)
            }
            Button {
            } label: {
                CustomAckLabels(title: "Apps by dev", image: "square.grid.2x2", color: .teal)
            }
            Button {
            } label: {
                CustomAckLabels(title: "Website", image: "link", color: .blue)
            }
        }
    }
}

struct SupportDevView_Previews: PreviewProvider {
    static var previews: some View {
        List{
            SupportDevView()
        }
    }
}
