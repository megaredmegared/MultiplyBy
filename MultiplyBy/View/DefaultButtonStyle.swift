//
//  ButtonStyleMain.swift
//  MultiplyBy
//
//  Created by megared on 21/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI


/// Button style for mains buttons
struct DefaultButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme
    let cornerRadius: CGFloat = 5
    private let size: CGFloat = 2
    var foregroundColor: Color = .lightBlack
    var backgroundColor: Color = .lightWhite
    var gradientFirstColor: Color = .lightWhite
    var gradientSecondColor: Color = .fullWhite
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .roundedText(size: 20, weight: .bold)
            .foregroundColor(foregroundColor)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .modifier(configuration.isPressed ? SoftShadow(isEnabled: false) : SoftShadow(isEnabled: true))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(
                        LinearGradient(gradient: Gradient(colors: [ gradientFirstColor, gradientSecondColor]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
        )
    }
}

struct DefaultButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            // void
        }) {
            Text("test")
        }.buttonStyle(DefaultButtonStyle())
        
    }
}
