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
    var timesTables: TimesTables
    
    private var showLanguageButton: Bool {
        if Locale.preferredLanguages.count > 1 {
            return true
        }
        return false
    }
    
    var language: String {
        let language = Bundle.main.preferredLocalizations.first ?? "None"
        if language == "en" {
            return "English"
        }
        return "Français"
        
    }
    
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("TitleOfTheSettingsView", comment: "Titles for the settings View")
                    .roundedText(style: .body)
                
                if showLanguageButton {
                    Button(action: {
                        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                    }) {
                        Text("SelectLanguageButton: \(self.language)", comment: "Button for selecting another language")
                            .roundedText(style: .body)
                    }
                }
                
                Button(action: {
                    self.timesTables.saveChoosenTables()
                }) {
                    Text("save selected table", comment: "Save selected table button")
                        .font(Font.system(size: 25))
                        .roundedText(style: .body)
                        .foregroundColor(.white)
                        
                }
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("back")
                        .roundedText(size: 20, weight: .bold)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(timesTables: TimesTables(numberOfTables: 12))
    }
}
