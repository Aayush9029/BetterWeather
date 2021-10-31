//
//  SideSettingsView.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-22.
//

import SwiftUI

struct SideSettingsView: View {
    @State var isMilk: Bool = false
    var body: some View {
        VStack {
            VStack {
                List{
                    Section(
                        header: CustomAckLabels(title: "Quick Settings", image: "gear", color: .gray)
                    ){
                        Button {
                        } label: {
                            Label("Update Location", systemImage: "location")
                        }
                        Button {
                        } label: {
                            Label("Refresh Weather Data", systemImage: "arrow.clockwise.circle")
                        }
                    }.symbolVariant(.fill)
                    
                    
                    Section(
                        header:  CustomAckLabels(title: "Background Style", image: "photo.fill", color: .purple)
                    ){
                        Toggle("Animated Milk", isOn: $isMilk )
                        Toggle("Pure Black", isOn: $isMilk )
                        Toggle("Clouds image", isOn: $isMilk )
                        Toggle("Abstract", isOn: $isMilk )
                        Toggle("Video", isOn: $isMilk )
                    }
                    .tint(.orange)
                    

                    AcknowledgementsView()

                    SupportDevView()

                    LogView()
                }
                Text("Made with ❤️ in 🇨🇦")
                    .bold()
                    .foregroundStyle(.secondary)
            }
        .navigationTitle("Better Weather")
        }
    }
}

struct SideSettingsView_Previews: PreviewProvider {
    static var previews: some View {
            SideSettingsView()
    }
}

