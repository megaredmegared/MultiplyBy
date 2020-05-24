//
//  ContentView.swift
//  MultiplyBy
//
//  Created by megared on 15/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct DeleteNavBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("")
            .navigationBarHidden(true)
    }
}

extension View {
    func deleteNavBar() -> some View {
        self.modifier(DeleteNavBar())
    }
}


struct ContentView: View {
    
    let timesTables = TimesTables(numberOfTables: 12)
    
    var body: some View {
        
        GeometryReader { geo in
            NavigationView {
                ZStack {
                    Color.lightWhite.edgesIgnoringSafeArea(.all)
                    VStack {
                        
                        AppTitle()
                        
                        Spacer(minLength: 4)
                        
                        ButtonsChoice()
                        
                        Spacer(minLength: 4)
                        
                        NavigationButtons(timesTables: self.timesTables)
                        
                        Spacer(minLength: 0)
                        
                    }.frame(maxWidth: 600)
                    
                    SettingsButton()
                }
            .deleteNavBar()
                
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
        .environmentObject(timesTables)
        .statusBar(hidden: true)
    }    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 11", "iPhone SE (1st generation)", "iPhone SE (2nd generation)", "iPhone 11 Pro Max",  "iPad Pro (12.9-inch) (3rd generation)"], id: \.self) { deviceName in
            Group {
                ContentView()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .previewDisplayName(deviceName)
                    .environment(\.colorScheme, .light)
                ContentView()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .previewDisplayName(deviceName)
                    .environment(\.colorScheme, .dark)
            }
        }
    }
}
