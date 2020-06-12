//
//  NumPad.swift
//  MultiplyBy
//
//  Created by megared on 12/05/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

/// NumPad to enter the results answers when in the game
struct NumPad: View {
    var geoSize: CGSize
    var spacing: CGFloat = 8
    var textSize: CGFloat = 0.1
    var isGameView: Bool
    
    var body: some View {
        
        VStack(spacing: self.spacing) {
            HStack(spacing: self.spacing) {
                VStack(spacing: self.spacing) {
                    HStack(spacing: self.spacing) {
                        NumpadButton(7, geoSize: self.geoSize)
                        NumpadButton(8, geoSize: self.geoSize)
                        NumpadButton(9, geoSize: self.geoSize)
                    }
                    
                    HStack(spacing: self.spacing) {
                        NumpadButton(4, geoSize: self.geoSize)
                        NumpadButton(5, geoSize: self.geoSize)
                        NumpadButton(6, geoSize: self.geoSize)
                    }
                    HStack(spacing: self.spacing) {
                        NumpadButton(1, geoSize: self.geoSize)
                        NumpadButton(2, geoSize: self.geoSize)
                        NumpadButton(3, geoSize: self.geoSize)
                    }
                    NumpadButton(0, geoSize: self.geoSize)
                }
                VStack(spacing: self.spacing) {
                    NumpadDeleteButton(geoSize: self.geoSize)
                    
                    NumpadValidationButton(geoSize: self.geoSize, isGameView: self.isGameView)
                }.aspectRatio(0.25, contentMode: .fit)
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

struct NumPad_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            VStack {
                NumPad(geoSize: geo.size, isGameView: true)
            }
            .padding()
            .background(Color.blue)
        }
        .background(Color.red)
    }
}

struct NumpadButton: View {
    @EnvironmentObject var game: GameViewModel
    var number: String
    var geoSize: CGSize
    var textSize: CGFloat
    init(_ number: Int, geoSize: CGSize) {
        self.number = String(number)
        self.geoSize = geoSize
        self.textSize = 0.1
    }
    
    var body: some View {
        Button(action: {
            self.addNumber(self.number)
        }) {
            Text(self.number)
        }
        .buttonStyle(MainButtonStyle(textSize: geoSize.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
    }
    
    func addNumber(_ number: String) {
        guard self.game.multiplicationAnswer.count < 3 else {
            return
        }
        if self.game.multiplicationAnswer == "0" {
            self.game.multiplicationAnswer = ""
        }
        self.game.multiplicationAnswer.append(number)
    }
}

struct NumpadValidationButton: View {
    @EnvironmentObject var game: GameViewModel
    var geoSize: CGSize
    var isGameView: Bool
    var textSize: CGFloat
    
    init(geoSize: CGSize, isGameView: Bool) {
        self.geoSize = geoSize
        self.textSize = 0.1
        self.isGameView = isGameView
    }
    
    var body: some View {
        Button(action: {
            self.validateButton()
        }) {
            Text("OK")
        }
        .buttonStyle(MainButtonStyle(textSize: geoSize.width * self.textSize * 0.8, foregroundColor: .lightWhite, backgroundColor: .table5, innerDarkShadow: .table5DarkShadow, innerLightShadow: .table5LightShadow, maxWidth: .infinity, maxHeight: .infinity))
    }
    
    func validateButton() {
        guard self.game.multiplicationAnswer == self.game.multiplicationQuestion.result else {
            self.game.isGoodAnswer = false
            self.game.badAnswer += 1
            return
        }
        
        if self.isGameView {
            self.game.score += 1
            self.game.multiplicationAnswer = "0"
            self.game.isGoodAnswer = true
            self.game.pickNextMultiplication(tables: self.game.allTables)
        } else {
            self.game.multiplicationAnswer = "0"
            self.game.isGoodAnswer = true
            self.game.pickNextMultiplication(tables: self.game.choosenTables)
        }
        
        #if DEBUG
        print(self.game.multiplicationQuestion)
        print(self.game.multiplicationAnswer)
        #endif
    }
}

struct NumpadDeleteButton: View {
    @EnvironmentObject var game: GameViewModel
    var geoSize: CGSize
    var textSize: CGFloat
    
    init(geoSize: CGSize) {
        self.geoSize = geoSize
        self.textSize = 0.1
    }
    var body: some View {
        Button(action: {
            self.game.multiplicationAnswer = "0"
            self.game.isGoodAnswer = true
        }) {
            Text("X")
        }
        .buttonStyle(MainButtonStyle(textSize: geoSize.width * self.textSize, foregroundColor: .lightWhite, backgroundColor: .table1, innerDarkShadow: .table1DarkShadow, innerLightShadow: .table1LightShadow, maxWidth: .infinity, maxHeight: .infinity))
    }
}
