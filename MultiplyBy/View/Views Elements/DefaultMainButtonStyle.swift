//
//  ButtonStyleMain.swift
//  MultiplyBy
//
//  Created by megared on 21/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI


/// Button style for mains buttons
struct DefaultMainButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme
    var textSize: CGFloat = 20
    var cornerRadius: CGFloat = 5
    private let size: CGFloat = 2
    var foregroundColor: Color = .lightBlack
    var backgroundColor: Color = .lightWhite
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
    }
}

struct DefaultMainButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            // void
        }) {
            Text("test")
        }
        .buttonStyle(DefaultButtonStyle())
//        .frame(width: 200, height: 200)
//        .background(Color.red)
    }
}
