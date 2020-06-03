//
//  NavigationButtons.swift
//  MultiplyBy
//
//  Created by megared on 28/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

/// Buttons for navigation
struct NavigationButtons: View {
    @EnvironmentObject var timesTables: TimesTablesViewModel
    @State private var presentLearnView = false
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) { 
                Button(action: {
                    self.presentLearnView.toggle()
                }) {
                    Text("LearnButtonLabel")
                }
                .sheet(isPresented: $presentLearnView) {
                    if self.timesTables.choosenTables.count == 1 {
                        LearnView(table: self.timesTables.choosenTables[0])
                    } else {
                        PageView(self.makeLearnViews())
                    }
                }
                .opacity(self.timesTables.choosenTables.isEmpty ? 0.2 : 1)
                .disabled(self.timesTables.choosenTables.isEmpty)
                
                NavigationLink(destination:
                ScoresView()) {
                    Text("ScoresButtonLabel")
                }
            }
            
            NavigationLink(destination:
            GameStartView()) {
                Text("PlayButtonLabel")
            }
        }
        .buttonStyle(MainButtonStyle(maxWidth: .infinity))
        .padding()
    }
    
    func makeLearnViews() -> [LearnView] {
        var learnViews: [LearnView] = []
        for table in self.timesTables.choosenTables.sorted() {
            learnViews.append(LearnView(table: table))
        }
        return learnViews as [LearnView]
    }
}

struct NavigationButtons_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButtons()
    }
}
