//
//  BackgroundGradient.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-22.
//

import SwiftUI

struct BackgroundGradient: View {

    @State var start = UnitPoint(x: 0, y: -2)
    @State var end = UnitPoint(x: 4, y: 0)
    let colors = [Color.orange, Color.pink, Color.purple, Color.orange, Color.red, Color.orange, Color.red]

    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
            .blur(radius: 250)
            .ignoresSafeArea()
            .onAppear(perform: {
                withAnimation(.linear(duration: 60).repeatForever(autoreverses: true)) {
                    self.start = UnitPoint(x: 4, y: 0)
                    self.end = UnitPoint(x: 0, y: 2)
                    self.start = UnitPoint(x: -4, y: 20)
                    self.start = UnitPoint(x: 4, y: 0)
                }
            })
    }
}

struct BackgroundGradient_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGradient()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
