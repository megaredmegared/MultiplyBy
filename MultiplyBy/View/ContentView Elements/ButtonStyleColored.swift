//
//  ColoredButtonView.swift
//  MultiplyBy
//
//  Created by megared on 15/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

/// Button style for colored buttons
struct ButtonStyleColored: ButtonStyle {

    private var isSelected: Bool

    private let colorScheme = AppColorScheme()
    private var table: Int
    private var text: String
    private var color: Color {
        colorScheme.returnColor(tableNumber: table)
    }

    private var selectedTable: Int

    init(table: Int, isSelected: Bool) {
        self.isSelected = isSelected
        self.table = table
        self.text = String(table)
        self.selectedTable = table
    }

    func makeBody(configuration: Self.Configuration) -> some View {

        var showOpacity: Bool {
            if configuration.isPressed && isSelected {
                return true
            } else if configuration.isPressed && !isSelected {
                return false
            } else if !isSelected {
                return false
            }

            return true
        }

        var showShadow: Bool {
            if configuration.isPressed || !isSelected {
                return true
            }
            return false
        }

        return GeometryReader { geo in
            configuration.label
                .foregroundColor(Color.lightWhite)
                .font(.system(size: geo.size.width * 0.35, weight: .black, design: .rounded))
                .frame(maxWidth: geo.size.width, maxHeight: geo.size.width)
                .background(color)
                .overlay(
                    Circle()
                        .strokeBorder(Color.lightWhite, lineWidth: geo.size.width * 0.05))
                .clipShape(Circle())
                .modifier(SoftShadow(isPressed: showShadow))
                .overlay(
                    Circle()
                        .stroke(Color.lightWhite, lineWidth: geo.size.width * 0.02))
                .overlay(
                    Circle()
                        .foregroundColor(Color.lightWhite.opacity(showOpacity ? 0 : 0.8))
                        .animation(.linear, value: showOpacity)
                )
                .padding(geo.size.width * 0.05)
                .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
                .rotationEffect(.degrees(configuration.isPressed ? -24.0 : 0))
                .animation(.interpolatingSpring(stiffness: 100, damping: 6), value: configuration.isPressed)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct ButtonStyleColored_Previews: PreviewProvider {
    static var previews: some View {

        Button {
            // void
        } label: {
            Text("")
        }.buttonStyle(ButtonStyleColored(table: 1, isSelected: true))
    }
}
