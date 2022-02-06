//
//  LogView.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-31.
//

import SwiftUI

struct LogView: View {
    var body: some View {
        Section(
            header: Label("Logs", systemImage: "heart.text.square")
        ) {
            VStack(alignment: .leading) {
                ForEach(0...10, id: \.self) { _ in
                    HStack {
                        Text("\(Date().get(.minute)):\(Date().get(.second)):\(Date().get(.nanosecond))")
                            .foregroundStyle(.secondary)
                        Text(" Loggs LoggsLoggsLoggsLoggsLoggsLoggsLoggsLoggsLoggs \(Int.random(in: 0...100000))")
                            .foregroundColor(.primary)
                    }.font(.caption2)

                    Divider()
                }
            }
        }
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            LogView()
        }
    }
}
