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
    var textSize: CGFloat
    var cornerRadius: CGFloat
    private let size: CGFloat = 2
    var foregroundColor: Color
    var backgroundColor: Color
    var innerDarkShadow: Color
    var innerLightShadow: Color
    var maxWidth: CGFloat?
    var maxHeight: CGFloat?
    
    init(
        textSize: CGFloat = 20,
        cornerRadius: CGFloat = 5,
        foregroundColor: Color = .lightBlack,
        backgroundColor: Color = .lightWhite,
        innerDarkShadow: Color = .blackShadow,
        innerLightShadow: Color = .whiteShadow,
        maxWidth: CGFloat? = nil,
        maxHeight: CGFloat? = nil
    ) {
        self.textSize = textSize
        self.cornerRadius = cornerRadius
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.innerDarkShadow = innerDarkShadow
        self.innerLightShadow = innerLightShadow
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: self.maxWidth, maxHeight: self.maxHeight)
            .roundedText(size: self.textSize, weight: .bold)
            .foregroundColor(self.foregroundColor)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background(self.backgroundColor)
            .cornerRadius(self.cornerRadius)
            .overlay(
                GeometryReader { geo in
                    RoundedRectangle(cornerRadius: self.cornerRadius + 2)
                        .trim(from: self.startPoint(size: geo.size), to: self.endPoint(size: geo.size))
                        .stroke(self.innerLightShadow, lineWidth: configuration.isPressed ? 3 : 0
                    )
                        .rotationEffect(.init(degrees: 180))
                        .overlay(
                            RoundedRectangle(cornerRadius: self.cornerRadius + 2)
                                .trim(from: self.startPoint(size: geo.size), to: self.endPoint(size: geo.size))
                                .stroke(self.innerDarkShadow, lineWidth: configuration.isPressed ? 3 : 0
                            )
                    )
                }.blur(radius: 2)
        )
            .clipShape(
                RoundedRectangle(cornerRadius: self.cornerRadius + 2)
                
        )
            .modifier(SoftShadow(isPressed: configuration.isPressed))
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
