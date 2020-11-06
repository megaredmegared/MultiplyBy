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
    var textSize: CGFloat {
        self.geoSize.width * 0.1
    }
    var isGameView: Bool
    
    var body: some View {
        
        VStack(spacing: self.spacing) {
            HStack(spacing: self.spacing) {
                VStack(spacing: self.spacing) {
                    HStack(spacing: self.spacing) {
                        NumpadButton(7, textSize: self.textSize)
                        NumpadButton(8, textSize: self.textSize)
                        NumpadButton(9, textSize: self.textSize)
                    }
                    
                    HStack(spacing: self.spacing) {
                        NumpadButton(4, textSize: self.textSize)
                        NumpadButton(5, textSize: self.textSize)
                        NumpadButton(6, textSize: self.textSize)
                    }
                    HStack(spacing: self.spacing) {
                        NumpadButton(1, textSize: self.textSize)
                        NumpadButton(2, textSize: self.textSize)
                        NumpadButton(3, textSize: self.textSize)
                    }
                    NumpadButton(0, textSize: self.textSize)
                }
                VStack(spacing: self.spacing) {
                    NumpadDeleteButton(textSize: self.textSize)
                        .frame(height: self.geoSize.width / 4 - self.spacing * 0.75)
                    
                    NumpadValidationButton(textSize: self.textSize, isGameView: self.isGameView)
                }
                .frame(width: self.geoSize.width / 4 - self.spacing * 0.75)
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

struct NumPad_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            GeometryReader { geo in
                VStack {
                    NumPad(geoSize: geo.size, isGameView: true)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .padding()
    }
}

struct TouchDownButtonStyle: PrimitiveButtonStyle {
    
    var textSize: CGFloat
    var cornerRadius: CGFloat = 5
    var foregroundColor: Color = .lightBlack
    var backgroundColor: Color = .lightWhite
    var innerDarkShadow: Color = .blackShadow
    var innerLightShadow: Color = .whiteShadow
    
    struct MyButton: View {
        
        var textSize: CGFloat
        var cornerRadius: CGFloat
        var foregroundColor: Color
        var backgroundColor: Color
        var innerDarkShadow: Color
        var innerLightShadow: Color
        
        @GestureState private var isPressed = false
        
        let configuration: PrimitiveButtonStyle.Configuration
        
        var body: some View {
            let longPress = LongPressGesture(minimumDuration: .infinity, maximumDistance: 50)
                .updating($isPressed) { currentstate, gestureState, _ in
                    gestureState = currentstate }
                .onChanged{_ in self.configuration.trigger()}
            
            return configuration.label
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .roundedText(size: self.textSize, weight: .bold)
                .foregroundColor(self.foregroundColor)
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .background(self.backgroundColor)
                .cornerRadius(self.cornerRadius)
                .overlay(
                    GeometryReader { geo in
                        RoundedRectangle(cornerRadius: self.cornerRadius + 2)
                            .trim(from: self.startPoint(size: geo.size),
                                  to: self.endPoint(size: geo.size))
                            .stroke(self.innerLightShadow, lineWidth: isPressed ? 3 : 0
                            )
                            .rotationEffect(.init(degrees: 180))
                            .overlay(
                                RoundedRectangle(cornerRadius: self.cornerRadius + 2)
                                    .trim(from: self.startPoint(size: geo.size), to: self.endPoint(size: geo.size))
                                    .stroke(self.innerDarkShadow, lineWidth: isPressed ? 3 : 0
                                    )
                            )
                    }
                    .blur(radius: 2))
                .clipShape(RoundedRectangle(cornerRadius: self.cornerRadius + 2))
                .modifier(SoftShadow(isPressed: isPressed))
                .gesture(longPress)
        }
        func startPoint(size: CGSize) -> CGFloat {
            let width = size.width
            let height = size.height
            return (width + height / 2) / ((width + height) * 2)
        }
        func endPoint(size: CGSize) -> CGFloat {
            let width = size.width
            let height = size.height
            return (width * 2 + height * 1.5) / ((width + height) * 2)
        }
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        MyButton(textSize: textSize,
                 cornerRadius: cornerRadius,
                 foregroundColor: foregroundColor,
                 backgroundColor: backgroundColor,
                 innerDarkShadow: innerDarkShadow,
                 innerLightShadow: innerLightShadow,
                 configuration: configuration)
    }
}

struct NumpadButton: View {
    @EnvironmentObject var game: GameViewModel
    var number: String
    var textSize: CGFloat
    init(_ number: Int, textSize: CGFloat) {
        self.number = String(number)
        self.textSize = textSize
    }
    
    var body: some View {
        Button(action: {
            self.addNumber(self.number)
        }) {
            Text(self.number)
        }
        .buttonStyle(TouchDownButtonStyle(textSize: self.textSize))
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
    var isGameView: Bool
    var textSize: CGFloat
    
    init(textSize: CGFloat, isGameView: Bool) {
        self.textSize = textSize
        self.isGameView = isGameView
    }
    
    var body: some View {
        Button(action: {
            self.validateButton()
        }) {
            Text("OK")
        }
        .buttonStyle(TouchDownButtonStyle(textSize: self.textSize * 0.8, foregroundColor: .lightWhite, backgroundColor: .table5, innerDarkShadow: .table5DarkShadow, innerLightShadow: .table5LightShadow))
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
    var textSize: CGFloat
    
    var body: some View {
        Button(action: {
            self.game.multiplicationAnswer = "0"
            self.game.isGoodAnswer = true
        }) {
            Text("X")
        }
        .buttonStyle(TouchDownButtonStyle(textSize: self.textSize, foregroundColor: .lightWhite, backgroundColor: .table1, innerDarkShadow: .table1DarkShadow, innerLightShadow: .table1LightShadow))
    }
}
