//
//  MultiplicationQuestionView.swift
//  MultiplyBy
//
//  Created by megared on 12/06/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

/// Enum for chose the type of game
enum GameType {
    case game, training
}

/// View that present the multiplication question
struct MultiplicationQuestionView: View {
    @EnvironmentObject var game: GameViewModel
    var geoSize: CGSize

    var gameType: GameType

    var tables: [TableViewModel] {
        switch gameType {
        case .game:
            return game.allTables
        case .training:
            return game.choosenTables
        }
    }

    var body: some View {
        HStack {
            Text(game.multiplicationQuestion.firstOperand)
            Text(" x ")
            Text(game.multiplicationQuestion.secondOperand)
        }
        .roundedText(size: geoSize.width * 0.15, weight: .bold)
        .foregroundColor(.table1)
        .onAppear {
            game.pickNextMultiplication(tables: tables)
        }
    }
}

struct MultiplicationQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplicationQuestionView(geoSize: CGSize(width: 400, height: 400), gameType: .training)
            .environmentObject(GameViewModel())
    }
}
