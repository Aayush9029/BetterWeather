//
//  SupportDevView.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-31.
//

import SwiftUI

struct SupportDevView: View {
    @Environment(\.openURL) var openUrl

    var body: some View {
        Section(
            header: CustomAckLabels(title: "Support Dev", image: "heart.fill", color: .pink)
        ) {

// MARK: - To Do
//            Button {
//                openUrl(URL(string: "https://apps.apple.com/us/developer/aayush-pokharel/id1532440924")!)
//
//            
//            } label: {
//                CustomAckLabels(title: "Rate App", image: "star", color: .yellow)
//            }

//            Button {
//                // Sends Discord Thanks via post request.
//                openUrl(URL(string: "https://apps.apple.com/us/developer/aayush-pokharel/id1532440924")!)
//
//            } label: {
//                CustomAckLabels(title: "Send thanks", image: "paperplane.fill", color: .blue)
//            }

            Button {
                openUrl(URL(string: "https://apps.apple.com/us/developer/aayush-pokharel/id1532440924")!)
            } label: {
                CustomAckLabels(title: "Apps by dev", image: "square.grid.2x2", color: .teal)
            }
            Button {
                openUrl(URL(string: "https://aayush9029.github.io/FinalWebpage/")!)
            } label: {
                CustomAckLabels(title: "Website", image: "link", color: .blue)
            }
        }
    }
}

struct SupportDevView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            SupportDevView()
        }
    }
}
