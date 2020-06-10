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
    @EnvironmentObject var game: GameViewModel
    @Binding var isGoodAnswer: Bool
    
    var spacing: CGFloat = 0.015
    var textSize: CGFloat = 0.1
    var isGameView: Bool
    
    var body: some View {
        GeometryReader { geo in
           HStack(spacing: 0) {
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Button(action: {
                            self.addNumber("7")
                        }) {
                            Text("7")
                        }
                        .buttonStyle(MainButtonStyle(textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                        .padding(geo.size.width * 0.01)
                        
                        Button(action: {
                            self.addNumber("8")
                        }) {
                            Text("8")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }.buttonStyle(MainButtonStyle( textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                        .padding(geo.size.width * 0.01)
                        
                        Button(action: {
                            self.addNumber("9")
                        }) {
                            Text("9")
                        }.buttonStyle(MainButtonStyle( textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                        .padding(geo.size.width * 0.01)
                    }
                    HStack(spacing: 0) {
                        Button(action: {
                            self.addNumber("4")
                        }) {
                            Text("4")
                        }.buttonStyle(MainButtonStyle( textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                        .padding(geo.size.width * 0.01)
                        
                        Button(action: {
                            self.addNumber("5")
                        }) {
                            Text("5")
                        }.buttonStyle(MainButtonStyle( textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                        .padding(geo.size.width * 0.01)
                        
                        Button(action: {
                            self.addNumber("6")
                        }) {
                            Text("6")
                        }.buttonStyle(MainButtonStyle( textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                        .padding(geo.size.width * 0.01)
                    }
                    HStack(spacing: 0) {
                        Button(action: {
                            self.addNumber("1")
                        }) {
                            Text("1")
                        }.buttonStyle(MainButtonStyle( textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                        .padding(geo.size.width * 0.01)
                        
                        Button(action: {
                            self.addNumber("2")
                        }) {
                            Text("2")
                        }.buttonStyle(MainButtonStyle( textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                        .padding(geo.size.width * 0.01)
                        
                        Button(action: {
                            self.addNumber("3")
                        }) {
                            Text("3")
                        }.buttonStyle(MainButtonStyle( textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                        .padding(geo.size.width * 0.01)
                    }
                    Button(action: {
                        self.addNumber("0")
                    }) {
                        Text("0")
                    }.buttonStyle(MainButtonStyle( textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                    .padding(geo.size.width * 0.01)
                    
                }
                .buttonStyle(MainButtonStyle())
                
                VStack(spacing: 0) {
                    Button(action: {
                        self.game.multiplicationAnswer = "0"
                        self.isGoodAnswer = true
                    }) {
                        Text("X")
                    }.buttonStyle(MainButtonStyle(textSize: geo.size.width * self.textSize, foregroundColor: .lightWhite, backgroundColor: .table1, innerDarkShadow: .table1DarkShadow, innerLightShadow: .table1LightShadow, maxWidth: .infinity, maxHeight: .infinity))
                    .padding(geo.size.width * 0.01)
                    
                    Button(action: {
                        guard self.game.multiplicationAnswer == self.game.multiplicationQuestion.result else {
                            self.isGoodAnswer = false
                            self.game.badAnswer += 1
                            return
                        }
                        
                        if self.isGameView {
                        self.game.score += 1
                        self.game.multiplicationAnswer = "0"
                        self.isGoodAnswer = true
                        self.game.pickNextMultiplication(tables: self.game.allTables)
                        } else {
                            self.game.multiplicationAnswer = "0"
                            self.isGoodAnswer = true
                            self.game.pickNextMultiplication(tables: self.game.choosenTables)
                        }
                        
                        print(self.game.multiplicationQuestion)
                        print(self.game.multiplicationAnswer)
                        
                        
                    }) {
                        Text("OK")
                    }.buttonStyle(MainButtonStyle(textSize: geo.size.width * self.textSize * 0.8, foregroundColor: .lightWhite, backgroundColor: .table5, innerDarkShadow: .table5DarkShadow, innerLightShadow: .table5LightShadow, maxWidth: .infinity, maxHeight: .infinity))
                        .frame(height: (geo.size.width * 0.75) - (geo.size.width * 0.01 * 2) )
                    .padding(geo.size.width * 0.01)
                    
                }.frame(width: geo.size.width * 0.25)
            }
           .frame(width: geo.size.width,
            height: geo.size.width)
        }
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


struct NumPad_Previews: PreviewProvider {
    static var previews: some View {
        NumPad(isGoodAnswer: .constant(true), isGameView: true)
    }
}
