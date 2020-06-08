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
    @EnvironmentObject var timesTables: TimesTablesViewModel
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
                            self.addNumber("1")
                        }) {
                            Text("1")
                        }
                        .buttonStyle(MainButtonStyle(textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                        .padding(geo.size.width * 0.01)
                        
                        Button(action: {
                            self.addNumber("2")
                        }) {
                            Text("2")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }.buttonStyle(MainButtonStyle( textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                        .padding(geo.size.width * 0.01)
                        
                        Button(action: {
                            self.addNumber("3")
                        }) {
                            Text("3")
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
                            self.addNumber("7")
                        }) {
                            Text("7")
                        }.buttonStyle(MainButtonStyle( textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                        .padding(geo.size.width * 0.01)
                        
                        Button(action: {
                            self.addNumber("8")
                        }) {
                            Text("8")
                        }.buttonStyle(MainButtonStyle( textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                        .padding(geo.size.width * 0.01)
                        
                        Button(action: {
                            self.addNumber("9")
                        }) {
                            Text("9")
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
                        self.timesTables.multiplicationAnswer = "0"
                        self.isGoodAnswer = true
                    }) {
                        Text("X")
                    }.buttonStyle(MainButtonStyle(textSize: geo.size.width * self.textSize, foregroundColor: .lightWhite, backgroundColor: .table1, maxWidth: .infinity, maxHeight: .infinity))
                    .padding(geo.size.width * 0.01)
                    
                    Button(action: {
                        guard self.timesTables.multiplicationAnswer == self.timesTables.multiplicationQuestion.result else {
                            self.isGoodAnswer = false
                            self.timesTables.badAnswer += 1
                            return
                        }
                        
                        if self.isGameView {
                        self.timesTables.score += 1
                        self.timesTables.multiplicationAnswer = "0"
                        self.isGoodAnswer = true
                        self.timesTables.pickNextMultiplication(tables: self.timesTables.allTables)
                        } else {
                            self.timesTables.multiplicationAnswer = "0"
                            self.isGoodAnswer = true
                            self.timesTables.pickNextMultiplication(tables: self.timesTables.choosenTables)
                        }
                        
                        print(self.timesTables.multiplicationQuestion)
                        print(self.timesTables.multiplicationAnswer)
                        
                        
                    }) {
                        Text("OK")
                    }.buttonStyle(MainButtonStyle(textSize: geo.size.width * self.textSize * 0.8, foregroundColor: .lightWhite, backgroundColor: .table4, maxWidth: .infinity, maxHeight: .infinity))
                        .frame(height: (geo.size.width * 0.75) - (geo.size.width * 0.01 * 2) )
                    .padding(geo.size.width * 0.01)
                    
                }.frame(width: geo.size.width * 0.25)
            }
           .frame(width: geo.size.width,
            height: geo.size.width)
        }
    }
    
    func addNumber(_ number: String) {
        if self.timesTables.multiplicationAnswer == "0" {
            self.timesTables.multiplicationAnswer = ""
        }
        self.timesTables.multiplicationAnswer.append(number)
    }
}


struct NumPad_Previews: PreviewProvider {
    static var previews: some View {
        NumPad(isGoodAnswer: .constant(true), isGameView: true)
    }
}
