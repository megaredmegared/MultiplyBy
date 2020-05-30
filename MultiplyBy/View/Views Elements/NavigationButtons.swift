//
//  NavigationButtons.swift
//  MultiplyBy
//
//  Created by megared on 28/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct NavigationButtons: View {
    var timesTables: TimesTablesViewModel
    
    @State private var isPresentedLearnSheet = false
    
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
                    PageView(self.makeLearnViews())
                }
                
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
        .buttonStyle(DefaultMainButtonStyle(maxWidth: .infinity))
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
        NavigationButtons(timesTables: TimesTablesViewModel(numberOfTables: 12))
    }
}