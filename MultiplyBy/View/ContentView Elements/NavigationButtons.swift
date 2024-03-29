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
    @State private var presentLearnView: Bool = false

    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                Button {
                    presentLearnView.toggle()
                } label: {
                    Text(Translation.learnButtonLabel.rawValue)
                }
                .sheet(isPresented: $presentLearnView) {
                    if game.choosenTables.count == 1 {
                        LearnView(table: game.choosenTables[0], showPageView: $presentLearnView)
                    } else {
                        PageView(makeLearnViews(), isPresented: $presentLearnView)
                    }
                }
                .opacity(game.choosenTables.isEmpty ? 0.2 : 1)
                .disabled(game.choosenTables.isEmpty)

                NavigationLink(destination:
                ScoresView()) {
                    Text(Translation.scoresButtonLabel.rawValue)
                }

            }

            NavigationLink(destination:
            GameStartView()) {
                Text(Translation.playButtonLabel.rawValue)
            }
        }
        .buttonStyle(MainButtonStyle(maxWidth: .infinity))
        .padding()
    }

    func makeLearnViews() -> [LearnView] {
        var learnViews: [LearnView] = []
        for table in game.choosenTables.sorted() {
            learnViews.append(LearnView(table: table, showPageView: $presentLearnView))
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
