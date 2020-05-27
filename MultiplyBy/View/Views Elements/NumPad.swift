//
//  NumPad.swift
//  MultiplyBy
//
//  Created by megared on 12/05/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

/// NumPad to enter the results when in the game
struct NumPad: View {
    @Binding var result: String
    @Binding var score: Int
    
    var multiplication: MultiplicationViewModel
    
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
                        self.result = "0"
                    }) {
                        Text("X")
                    }.buttonStyle(DefaultMainButtonStyle(textSize: geo.size.width * self.textSize, foregroundColor: .lightWhite, backgroundColor: .table1, maxWidth: .infinity, maxHeight: .infinity))
                    .padding(geo.size.width * 0.01)
                    
                    Button(action: {
                        if self.result == self.multiplication.result {
                            self.score += 1
                        }
                        
                        self.result = "0"
                        print(self.result)
                        print(self.multiplication.result)
                        
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
        if self.result == "0" {
            self.result = ""
        }
        self.result.append(number)
    }
}


struct NumPad_Previews: PreviewProvider {
    static var previews: some View {
        NumPad(result: .constant(""), score: .constant(0), multiplication: MultiplicationViewModel(firstOperand: "4", secondOperand: "5", result: "20"))
    }
}
