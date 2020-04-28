//
//  ColoredButtonView.swift
//  MultiplyBy
//
//  Created by megared on 15/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI



struct ButtonStyleColored: ButtonStyle {

    private var isSelected: Bool
    
    private let colorScheme = ColorScheme()
    private var table: Int
    private var text: String
    private var color: Color {
        colorScheme.returnColor(number: table)
    }

//    private var shadowColor: Color {
//        colorScheme.returnColor(number: table, shadowColor: true)
//    }
    
    private var selectedTable: Int

    init(table: Int, isSelected: Bool) {
        self.isSelected = isSelected
        self.table = table
        self.text = String(table)
        self.selectedTable = table
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        GeometryReader { geo in
            configuration.label
                .foregroundColor(Color(.systemGray6))
                .font(.system(size: geo.size.width * 0.4, weight: .black, design: .rounded))
                .frame(maxWidth: geo.size.width, maxHeight: geo.size.width)
                .background(self.color)
                .overlay(
                    Circle()
                        .strokeBorder(self.color,lineWidth: geo.size.width * 0.12)
                        .colorMultiply(self.color.opacity(0.5))
                        .overlay(
                            Circle()
                                .stroke(Color(.systemGray6),lineWidth: geo.size.width * 0.1)))
                .overlay(
                    Circle()
                        .foregroundColor(Color(.systemGray6).opacity(self.isSelected ? 0 : 0.7)).animation(.none)
                    )
                .clipShape(Circle())
                .shadow(color: Color.primary.opacity(self.isSelected ? 0.3 : 0.0), radius: configuration.isPressed ? 0 : geo.size.width * 0.03)
                .padding(geo.size.width * 0.05)
                .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
                .animation(.interpolatingSpring(stiffness: 100, damping: 6))
        }
    }
}

struct ButtonStyleColored_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            // void
        }) {
            Text("")
        }.buttonStyle(ButtonStyleColored(table: 1, isSelected: true))
    }
}
