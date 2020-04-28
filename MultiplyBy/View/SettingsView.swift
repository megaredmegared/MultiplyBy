//
//  SettingsView.swift
//  MultiplyBy
//
//  Created by megared on 28/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Settings View")
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("back").font(.largeTitle).fontWeight(.bold).foregroundColor(.white)
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
