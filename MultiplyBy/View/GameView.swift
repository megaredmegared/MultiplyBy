//
//  GameView.swift
//  MultiplyBy
//
//  Created by megared on 21/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI
import Combine

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var game: GameViewModel

    let colorScheme = AppColorScheme()

    var spacing: CGFloat = 4
    var textSize: CGFloat = 40

    @State var showEnterScoreView = false
    let isGameView = true
    @State var multiplicationAnswer2 = "0"

    var body: some View {

        ZStack {
            ZStack {

                Color.lightWhite.edgesIgnoringSafeArea(.all)
                GeometryReader { geo in
                    VStack(spacing: 2) {

                        // MARK: - Timer
                        GameTimer(size: geo.size.height * 0.05, isOver: $showEnterScoreView)

                        // MARK: - Score
                        Text(Translation.scoreInGameLabel.rawValue) + Text(" \(game.score)")

                        Spacer()

                        // MARK: - Multiplication Question
                        MultiplicationQuestionView(geoSize: geo.size, gameType: .game)

                        // MARK: - Multiplication Answer
                        MultiplicationAnswerView(geoSize: geo.size)
                        Spacer()
                        // MARK: - Numpad
                        NumPad(geoSize: geo.size, isGameView: isGameView)
                    }
                }
                .padding()

                // MARK: - Back Button
                Button {
                    game.resetValue()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrowtriangle.left.circle.fill")
                        .resizable()
                }
                .buttonStyle(RoundedBackButtonStyle())
            }
            .blur(radius: showEnterScoreView ? 10 : 0)

            // MARK: - Enter Score View
            if showEnterScoreView {
                Color.lightWhite.opacity(0.5).edgesIgnoringSafeArea(.all)
                    .transition(.opacity)
                EnterScoreView(game: game)
                    .transition(.scale)
            }
        }
        .deleteNavBar()
        .statusBar(hidden: true) // iOS 14.0 fix
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(GameViewModel())
    }
}
