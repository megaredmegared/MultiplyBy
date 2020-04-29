//
//  ContentView.swift
//  MultiplyBy
//
//  Created by megared on 15/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let timesTables = TimesTables()
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                Color.lightWhite.edgesIgnoringSafeArea(.all)
                VStack {
                    AppTitle()
                    
                    Spacer(minLength: 4)
                    
                    ButtonsChoice()
                    
                    Spacer(minLength: 4)
                    
                    NavigationButtons()
                    
                    Spacer(minLength: 0)
                    
                }.frame(maxWidth: 600)
                
                SettingsButton()
            }
        }.environmentObject(timesTables)
        .statusBar(hidden: true)
    }    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ForEach(["iPhone 11", "iPhone SE (1st generation)", "iPhone SE (2nd generation)", "iPhone 11 Pro Max",  "iPad Pro (12.9-inch) (3rd generation)"], id: \.self) { deviceName in
//            ContentView()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.colorScheme, .light)
            ContentView()
                .environment(\.colorScheme, .dark)
        }
    }
}
