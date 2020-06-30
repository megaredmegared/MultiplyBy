//
//  ContentView.swift
//  MultiplyBy
//
//  Created by megared on 15/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        GeometryReader { geo in
            NavigationView {
                ZStack {
                    Color.lightWhite.edgesIgnoringSafeArea(.all)
                    VStack {
                        
                        AppTitle()
                        
                        Spacer(minLength: 20)
                        
                        ButtonsChoice()
                        
                        Spacer(minLength: 20)
                        
                        NavigationButtons()
                        
                        Spacer(minLength: 0)
                        
                    }
                    
                    SettingsButton()
                    
                }
                .deleteNavBar()
                
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (1st generation)", "iPhone SE (2nd generation)", "iPhone 11", "iPhone 11 Pro Max"], id: \.self) { deviceName in
            Group {
                ContentView()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .previewDisplayName(deviceName)
                    .environment(\.colorScheme, .light)
                    .environmentObject(GameViewModel())
                    .environmentObject(AppState())

                ContentView()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .previewDisplayName(deviceName)
                    .environment(\.colorScheme, .dark)
                    .environmentObject(GameViewModel())
                    .environmentObject(AppState())
            }
        }
    }
}
