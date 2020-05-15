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
        Locale.preferredLanguages.count > 1 ? true : false
    }
    
    private var language: String {
        let language = Bundle.main.preferredLocalizations.first ?? "None"
        if language == "en" {
            return "English"
        }
        return "Français"
        
    }
    
    var body: some View {
        ZStack {
            Color.lightWhite.edgesIgnoringSafeArea(.all)
            GeometryReader { geo in
                VStack(spacing: 10) {
                    Text("TitleOfTheSettingsView", comment: "Titles for the settings View")
                        .roundedText(size: geo.size.width * 0.08, weight: .black)
                    
                    
                    Spacer()
                    
                    if self.showLanguageButton {
                        Button(action: {
                            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                        }) {
                            Group {
                                Text("SelectLanguageButton", comment: "Button for selecting another language")
                                    + Text(" ")
                                    + Text("\(self.language)")
                                
                            }
                            .frame(maxWidth: .infinity)
                        }.buttonStyle(DefaultButtonStyle())
                        
                    }
                    
                    Button(action: {
                        self.timesTables.saveChoosenTables()
                    }) {
                        Text("SaveSelectedTable", comment: "Save selected table button").frame(maxWidth: .infinity)
                    }
                    .buttonStyle(DefaultButtonStyle())
                    
                    Spacer()
                    
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("back").frame(maxWidth: .infinity)
                    }
                    .buttonStyle(DefaultButtonStyle(foregroundColor: .lightWhite, backgroundColor: .table1))
                    
                }
                .padding()
            }
        }
    }
}

