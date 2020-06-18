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
    @EnvironmentObject var game: GameViewModel
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
                    if self.game.choosenTables.count == 1 {
                        LearnView(table: self.game.choosenTables[0])
                    } else {
                        PageView(self.makeLearnViews())
                    }
                }
                .opacity(self.game.choosenTables.isEmpty ? 0.2 : 1)
                .disabled(self.game.choosenTables.isEmpty)
                .accessibility(identifier: "LearnButtonUITest")
                
                
                NavigationLink(destination:
                ScoresView()) {
                    Text("ScoresButtonLabel")
                }
                .accessibility(identifier: "ScoresButtonUITest")
            }
            
            NavigationLink(destination:
            GameStartView()) {
                Text("PlayButtonLabel")
            }
            .accessibility(identifier: "PlayButtonUITest")
        
        }
        .buttonStyle(MainButtonStyle(maxWidth: .infinity))
        .padding()
    }
    
    func makeLearnViews() -> [LearnView] {
        var learnViews: [LearnView] = []
        for table in self.game.choosenTables.sorted() {
            learnViews.append(LearnView(table: table))
        }
        return learnViews as [LearnView]
    }
}

struct NavigationButtons_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButtons()
        .environmentObject(GameViewModel())
    }
}
