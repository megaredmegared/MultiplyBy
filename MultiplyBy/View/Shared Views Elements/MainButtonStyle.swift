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
    var textSize: CGFloat = 20
    var cornerRadius: CGFloat = 5
    private let size: CGFloat = 2
    var foregroundColor: Color = .lightBlack
    var backgroundColor: Color = .lightWhite
    var innerDarkShadow: Color = .blackShadow
    var innerLightShadow: Color = .whiteShadow
    var maxWidth: CGFloat? = nil
    var maxHeight: CGFloat? = nil
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: maxWidth, maxHeight: maxHeight)
            .roundedText(size: textSize, weight: .bold)
            .foregroundColor(foregroundColor)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .overlay(
                GeometryReader { geo in
                    RoundedRectangle(cornerRadius: cornerRadius + 2)
                        .trim(from: startPoint(size: geo.size), to: endPoint(size: geo.size))
                        .stroke(innerLightShadow, lineWidth: configuration.isPressed ? 3 : 0
                    )
                        .rotationEffect(.init(degrees: 180))
                        .overlay(
                            RoundedRectangle(cornerRadius: cornerRadius + 2)
                                .trim(from: startPoint(size: geo.size), to: endPoint(size: geo.size))
                                .stroke(innerDarkShadow, lineWidth: configuration.isPressed ? 3 : 0
                            )
                    )
                }.blur(radius: 2)
        )
            .clipShape(
                RoundedRectangle(cornerRadius: cornerRadius + 2)
                
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
