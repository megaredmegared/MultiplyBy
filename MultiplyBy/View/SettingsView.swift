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
    @EnvironmentObject var timesTables: TimesTablesViewModel
    
    @State private var showingAlert = false
    
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
                VStack(spacing: 30) {
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
                        }.buttonStyle(DefaultMainButtonStyle())
                        
                    }
                    VStack(spacing: 10) {
                        Text("SaveSelectedTables").roundedText(size: 15, weight: .bold)
                            .foregroundColor(.gray)
                        
                        Button(action: {
                            self.showingAlert = self.timesTables.saveChoosenTables()
                        }) {
                            Text("Yes").frame(maxWidth: .infinity)
                        }
                        .buttonStyle(DefaultMainButtonStyle())
                        .alert(isPresented: self.$showingAlert) { Alert(title: Text("SelectedTablesSaved"), message: Text("SaveSelectedTablesMessage"), dismissButton: .default(Text("OK")))
                        }
                        
                        Spacer()
                        
                        BackButton()
                    }
                    
                }
            .padding()
            .frame(maxWidth: 600)
            }
        }
        .deleteNavBar()     
    }
}



