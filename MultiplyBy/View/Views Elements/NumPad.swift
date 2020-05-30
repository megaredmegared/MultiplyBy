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
                        .buttonStyle(DefaultMainButtonStyle(textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                        .padding(geo.size.width * 0.01)
                        
                        Button(action: {
                            self.addNumber("2")
                        }) {
                            Text("2")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }.buttonStyle(DefaultMainButtonStyle( textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                        .padding(geo.size.width * 0.01)
                        
                        Button(action: {
                            self.addNumber("3")
                        }) {
                            Text("3")
                        }.buttonStyle(DefaultMainButtonStyle( textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                        .padding(geo.size.width * 0.01)
                    }
                    HStack(spacing: 0) {
                        Button(action: {
                            self.addNumber("4")
                        }) {
                            Text("4")
                        }.buttonStyle(DefaultMainButtonStyle( textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                        .padding(geo.size.width * 0.01)
                        
                        Button(action: {
                            self.addNumber("5")
                        }) {
                            Text("5")
                        }.buttonStyle(DefaultMainButtonStyle( textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                        .padding(geo.size.width * 0.01)
                        
                        Button(action: {
                            self.addNumber("6")
                        }) {
                            Text("6")
                        }.buttonStyle(DefaultMainButtonStyle( textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                        .padding(geo.size.width * 0.01)
                    }
                    HStack(spacing: 0) {
                        Button(action: {
                            self.addNumber("7")
                        }) {
                            Text("7")
                        }.buttonStyle(DefaultMainButtonStyle( textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                        .padding(geo.size.width * 0.01)
                        
                        Button(action: {
                            self.addNumber("8")
                        }) {
                            Text("8")
                        }.buttonStyle(DefaultMainButtonStyle( textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                        .padding(geo.size.width * 0.01)
                        
                        Button(action: {
                            self.addNumber("9")
                        }) {
                            Text("9")
                        }.buttonStyle(DefaultMainButtonStyle( textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                        .padding(geo.size.width * 0.01)
                    }
                    Button(action: {
                        self.addNumber("0")
                    }) {
                        Text("0")
                    }.buttonStyle(DefaultMainButtonStyle( textSize: geo.size.width * self.textSize, maxWidth: .infinity, maxHeight: .infinity))
                    .padding(geo.size.width * 0.01)
                    
                }
                .buttonStyle(DefaultMainButtonStyle())
                
                VStack(spacing: 0) {
                    Button(action: {
                        self.timesTables.multiplicationAnswer = "0"
                        self.isGoodAnswer = true
                    }) {
                        Text("X")
                    }.buttonStyle(DefaultMainButtonStyle(textSize: geo.size.width * self.textSize, foregroundColor: .lightWhite, backgroundColor: .table1, maxWidth: .infinity, maxHeight: .infinity))
                    .padding(geo.size.width * 0.01)
                    
                    Button(action: {
                        guard self.timesTables.multiplicationAnswer == self.timesTables.multiplicationQuestion.result else {
                            self.isGoodAnswer = false
                            return
                        }
                        
                        self.timesTables.score += 1
                        self.timesTables.multiplicationAnswer = "0"
                        self.isGoodAnswer = true
                        self.timesTables.pickNextMultiplication(tables: self.timesTables.allTables)
                        
                        print(self.timesTables.multiplicationQuestion)
                        print(self.timesTables.multiplicationAnswer)
                        
                        
                    }) {
                        Text("OK")
                    }.buttonStyle(DefaultMainButtonStyle(textSize: geo.size.width * self.textSize, foregroundColor: .lightWhite, backgroundColor: .table4, maxWidth: .infinity, maxHeight: .infinity))
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
        NumPad(isGoodAnswer: .constant(true))
    }
}
