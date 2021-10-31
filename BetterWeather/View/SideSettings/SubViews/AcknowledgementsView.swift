//
//  AcknowledgementsView.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-31.
//

import SwiftUI

struct AcknowledgementsView: View {
    var body: some View {
        Section(
            header: CustomAckLabels(title: "Acknowledgement", image: "sparkles", color: .yellow)
        ) {
            Button {
            } label: {
                HStack{
                    Image("github-logo")
                        .resizable()
                        .frame(width: 25, height: 25, alignment: .center)
                    
                    Text("App source code")
                }
            }
            Button {
                
            } label: {
                CustomAckLabels(title: "Weather data", image: "cloud", color: .orange)
            }
            
        }
    }
}

struct AcknowledgementsView_Previews: PreviewProvider {
    static var previews: some View {
        List{
            AcknowledgementsView()
        }
    }
}
