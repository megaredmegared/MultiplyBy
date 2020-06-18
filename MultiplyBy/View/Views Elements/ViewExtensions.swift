//
//  ViewExtensions.swift
//  MultiplyBy
//
//  Created by megared on 09/05/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

extension Font {
    /// Monospaced digit for proper align in learn view
    func monospacedDigitFont() -> Font {
        self.monospacedDigit()
    }
}

extension View {
    /// default rounded style for the text of the app
    func roundedText(style: Font.TextStyle) -> some View {
        self.font(.system(style, design: .rounded))
    }
    
    /// default rounded style for the text of the app
    func roundedText(size: CGFloat = 20, weight: Font.Weight = .regular) -> some View {
        self.font(.system(size: size, weight: weight, design: .rounded))
    }
    
    /// Conditional use of modifier
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, content: (Self) -> Content) -> some View {
        if condition {
            content(self)
        }
        else {
            self
        }
    }
    
    /// delete navBar
    func deleteNavBar() -> some View {
        self.modifier(DeleteNavBar())
    }
}

/// delete navBar
struct DeleteNavBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("")
            .navigationBarHidden(true)
    }
}
