//
//  SideSettingsView.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-22.
//

import SwiftUI
import CoreLocation
#if canImport(CoreLocationUI)
import CoreLocationUI
#endif

struct SideSettingsView: View {
    @EnvironmentObject var forecaseViewModel: ForecastViewModel
    @EnvironmentObject var locationViewModel: LocationViewModel

    @State var isMilk: Bool = false
    var body: some View {
        VStack {
            VStack {
                List {
                    Section(
                        header: CustomAckLabels(title: "Quick Settings", image: "gear", color: .gray)
                    ) {

                        CurrentLocationButton {
                            locationViewModel.requestLocation()
                        }.foregroundColor(.white)
                            .symbolVariant(.fill)
                            .cornerRadius(10)
                            .shadow(color: .blue.opacity(0.5), radius: 5, x: 0, y: 2)
                            .padding()

                        Button {
                            Task {
                                await forecaseViewModel.fetchForecast()
                            }
                        } label: {
                            Label("Refresh Weather Data", systemImage: "arrow.clockwise.circle")
                        }
                    }.symbolVariant(.fill)

// MARK: - To Do

//                    Section(
//                        header:  CustomAckLabels(title: "Background Style", image: "photo.fill", color: .purple)
//                    ){
//                        Toggle("Animated Milk", isOn: $isMilk )
//                        Toggle("Pure Black", isOn: $isMilk )
//                        Toggle("Clouds image", isOn: $isMilk )
//                        Toggle("Abstract", isOn: $isMilk )
//                        Toggle("Video", isOn: $isMilk )
//                    }
//                    .tint(.orange)
//
                    AcknowledgementsView()

                    SupportDevView()
                    Divider()
                    ApiKeyAddView()

// MARK: - To Do
//                    LogView()
                }
                Text("Made with ❤️ in 🇨🇦")
                    .bold()
                    .foregroundStyle(.secondary)
                    .padding(.bottom)
            }
        .navigationTitle("Better Weather")
        }
    }
}

private struct CurrentLocationButton: View {
    let action: () -> Void

    var body: some View {
#if canImport(CoreLocationUI)
        LocationButton(.currentLocation, action: action)
#else
        Button(action: action) {
            Label("Current Location", systemImage: "location.fill")
        }
        .buttonStyle(.borderedProminent)
#endif
    }
}

struct SideSettingsView_Previews: PreviewProvider {
    static var previews: some View {
            SideSettingsView()
    }
}
