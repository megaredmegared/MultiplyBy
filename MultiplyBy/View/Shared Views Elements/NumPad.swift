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
        geoSize.width * 0.1
    }
    var isGameView: Bool

    var body: some View {

        VStack(spacing: spacing) {
            HStack(spacing: spacing) {
                VStack(spacing: spacing) {
                    HStack(spacing: spacing) {
                        NumpadButton(7, textSize: textSize)
                        NumpadButton(8, textSize: textSize)
                        NumpadButton(9, textSize: textSize)
                    }

                    HStack(spacing: spacing) {
                        NumpadButton(4, textSize: textSize)
                        NumpadButton(5, textSize: textSize)
                        NumpadButton(6, textSize: textSize)
                    }
                    HStack(spacing: spacing) {
                        NumpadButton(1, textSize: textSize)
                        NumpadButton(2, textSize: textSize)
                        NumpadButton(3, textSize: textSize)
                    }
                    NumpadButton(0, textSize: textSize)
                }
                VStack(spacing: spacing) {
                    NumpadDeleteButton(textSize: textSize)
                        .frame(height: geoSize.width / 4 - spacing * 0.75)

                    NumpadValidationButton(textSize: textSize, isGameView: isGameView)
                }
                .frame(width: geoSize.width / 4 - spacing * 0.75)
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
                .onChanged {_ in configuration.trigger()}

            return configuration.label
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .roundedText(size: textSize, weight: .bold)
                .foregroundColor(foregroundColor)
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
                .overlay(
                    GeometryReader { geo in
                        RoundedRectangle(cornerRadius: cornerRadius + 2)
                            .trim(from: startPoint(size: geo.size),
                                  to: endPoint(size: geo.size))
                            .stroke(innerLightShadow, lineWidth: isPressed ? 3 : 0
                            )
                            .rotationEffect(.init(degrees: 180))
                            .overlay(
                                RoundedRectangle(cornerRadius: cornerRadius + 2)
                                    .trim(from: startPoint(size: geo.size), to: endPoint(size: geo.size))
                                    .stroke(innerDarkShadow, lineWidth: isPressed ? 3 : 0
                                    )
                            )
                    }
                    .blur(radius: 2))
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius + 2))
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
        Button {
            addNumber(number)
        } label: {
            Text(number)
        }
        .buttonStyle(TouchDownButtonStyle(textSize: textSize))
    }

    func addNumber(_ number: String) {
        guard game.multiplicationAnswer.count < 3 else {
            return
        }
        if game.multiplicationAnswer == "0" {
            game.multiplicationAnswer = ""
        }
        game.multiplicationAnswer.append(number)
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
        Button {
            validateButton()
        } label: {
            Text("OK")
        }
        .buttonStyle(TouchDownButtonStyle(
            textSize: textSize * 0.8,
            foregroundColor: .lightWhite,
            backgroundColor: .table5,
            innerDarkShadow: .table5DarkShadow,
            innerLightShadow: .table5LightShadow)
        )
    }

    func validateButton() {
        guard game.multiplicationAnswer == game.multiplicationQuestion.result else {
            game.isGoodAnswer = false
            game.badAnswer += 1
            return
        }

        if isGameView {
            game.score += 1
            game.multiplicationAnswer = "0"
            game.isGoodAnswer = true
            game.pickNextMultiplication(tables: game.allTables)
        } else {
            game.multiplicationAnswer = "0"
            game.isGoodAnswer = true
            game.pickNextMultiplication(tables: game.choosenTables)
        }

        #if DEBUG
        print(game.multiplicationQuestion)
        print(game.multiplicationAnswer)
        #endif
    }
}

struct NumpadDeleteButton: View {
    @EnvironmentObject var game: GameViewModel
    var textSize: CGFloat

    var body: some View {
        Button {
            game.multiplicationAnswer = "0"
            game.isGoodAnswer = true
        } label: {
            Text("X")
        }
        .buttonStyle(TouchDownButtonStyle(
            textSize: textSize,
            foregroundColor: .lightWhite,
            backgroundColor: .table1,
            innerDarkShadow: .table1DarkShadow,
            innerLightShadow: .table1LightShadow)
        )
    }
}
