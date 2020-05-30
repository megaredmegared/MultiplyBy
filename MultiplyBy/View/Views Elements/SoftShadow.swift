//
//  SoftShadow.swift
//  MultiplyBy
//
//  Created by megared on 29/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI


/// Modifier for adding soft shadows to views
struct SoftShadow: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    var size: CGFloat = 2
    
    var isPressed: Bool = false

    func body(content: Content) -> some View {
        content
            .shadow(color: colorScheme == .dark
                ? Color.black.opacity(
                    isPressed ? 0 : 0.8)
                : Color.primary.opacity(
                    isPressed ? 0 : 0.2),
                    radius: size, x: size, y: size)
            
            .shadow(color: colorScheme == .dark
                ? Color(.systemGray3).opacity(
                    isPressed ? 0 : 0.7)
                : Color.white.opacity(
                    isPressed ? 0 : 1),
            radius: size, x: -size, y: -size)
    }
}
