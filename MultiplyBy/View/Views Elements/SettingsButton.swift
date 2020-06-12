//
//  SettingsButton.swift
//  MultiplyBy
//
//  Created by megared on 28/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

/// Button to go to SettingsView
struct SettingsButton: View {
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                NavigationLink(destination: SettingsView()) {
                    Image(systemName: "gear")
                        .foregroundColor(Color.lightBlack)
                        .frame(width: 20, height: 20)
                }
            }
            .padding()
            
            Spacer()
        }.edgesIgnoringSafeArea(.all)
    }
}

struct SettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 11", "iPhone SE (1st generation)"], id: \.self) { deviceName in
            SettingsButton()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
