//
//  SoftShadow.swift
//  MultiplyBy
//
//  Created by megared on 29/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct SoftShadow: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    private let size: CGFloat = 2
    var isEnabled: Bool

    func body(content: Content) -> some View {

        VStack {
            if isEnabled {
                content
                .shadow(color: colorScheme == .dark
                    ? Color.black.opacity(0.8)
                    : Color.primary.opacity(0.2),
                        radius: size, x: size, y: size)
                .shadow(color: colorScheme == .dark
                    ? Color(.systemGray3).opacity(0.7)
                    : .white,
                        radius: size, x: -size, y: -size)
            } else {
                content
            }
        }


    }
}

extension View {
    func softShadow(isSelected: Bool = true) -> some View {
        self.modifier(SoftShadow(isEnabled: isSelected))
    }
}
