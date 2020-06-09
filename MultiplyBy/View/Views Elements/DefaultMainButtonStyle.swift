//
//  ButtonStyleMain.swift
//  MultiplyBy
//
//  Created by megared on 21/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

/// Button style for mains buttons
struct MainButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme
    var textSize: CGFloat = 20
    var cornerRadius: CGFloat = 5
    private let size: CGFloat = 2
    var foregroundColor: Color = .lightBlack
    var backgroundColor: Color = .lightWhite
    var innerBlackColor: Color = .blackShadow
    var innerColor: Color = .whiteShadow
    var maxWidth: CGFloat? = nil
    var maxHeight: CGFloat? = nil
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: maxWidth, maxHeight: maxHeight)
            .roundedText(size: self.textSize, weight: .bold)
            .foregroundColor(self.foregroundColor)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background(self.backgroundColor)
            .cornerRadius(self.cornerRadius)
            .modifier(SoftShadow(isPressed: configuration.isPressed))
            .overlay(
                RoundedRectangle(cornerRadius: self.cornerRadius)
                    .stroke(self.backgroundColor,
                            lineWidth: configuration.isPressed ? 4 : 0)
                    .shadow(color: self.innerBlackColor,
                            radius: 2, x: 2, y: 2)
                    .clipShape(
                        RoundedRectangle(cornerRadius: self.cornerRadius)
                )
                    .shadow(color: self.innerColor,
                            radius: 2, x: -2, y: -2)
                    .clipShape(
                        RoundedRectangle(cornerRadius: self.cornerRadius)
                )
        )
    }
}

struct MainButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            // void
        }) {
            Text("test")
        }
        .buttonStyle(MainButtonStyle())
    }
}
