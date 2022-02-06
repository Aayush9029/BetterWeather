//
//  ApiKeyAddView.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-11-07.
//

import SwiftUI

struct ApiKeyAddView: View {
    @Environment(\.openURL) var openURL
    @AppStorage(AppStorageKeys.storedAPIKey.rawValue) var apiKey = ""

    var body: some View {
        VStack {
            Button("Generate Api Key") {
                openURL(URL(string: "https://openweathermap.org/full-price#current")!)
            }
       TextField("Your api key", text: $apiKey)
            .padding(5)
               .font(.title2)
               .textFieldStyle(.plain)
               .overlay(
                   RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 2)
               )
        }
    }
}

struct ApiKeyAddView_Previews: PreviewProvider {
    static var previews: some View {
        ApiKeyAddView()
    }
}
