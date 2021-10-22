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
        List{
            Toggle("Animated Milk", isOn: $isMilk )
            Toggle("Pure Black", isOn: $isMilk )
            Toggle("Clouds image", isOn: $isMilk )
            Toggle("Abstract", isOn: $isMilk )
            Toggle("Video", isOn: $isMilk )
        }
        .tint(.orange)
    }
}

struct SideSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SideSettingsView()
    }
}
