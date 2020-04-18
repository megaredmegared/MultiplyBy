//
//  SwiftUIView.swift
//  MultiplyBy
//
//  Created by megared on 18/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct ColoredButton<Label>: View where Label: View {
    
    @State private var isSelected = false
    
    let colorScheme = ColorScheme().all
    var table: Int
    var text: String
    var color: Color {
        if table / colorScheme.count == 0 {
            return colorScheme[table][0]
        }
        return colorScheme[table % colorScheme.count][0]
    }
    
    var shadowColor: Color {
        if table / colorScheme.count == 0 {
            return colorScheme[table][1]
        }
        return colorScheme[table % colorScheme.count][1]
    }
    var selectedTable: Int
    
    //    init(table: Int) {
    //        self.table = table
    //        self.text = String(table)
    //        self.selectedTable = table
    //    }
    
    private let action: (() -> ())?
    
    private let label: (() -> Label)?
    
    
    init(table: Int, action: (() -> ())? = nil, label: (() -> Label)? = nil) {
        self.table = table
        self.text = String(table)
        self.selectedTable = table
        self.action = action
        self.label = label
    }
    
    var body: some View {
        Button(action: {
            self.isSelected.toggle()
            self.action?()
        }) {
            GeometryReader { geo in
                self.label?()
                    .foregroundColor(Color.white)
                    .font(.system(size: geo.size.width * 0.4, weight: .black, design: .rounded))
                    .shadow(color: self.shadowColor, radius: geo.size.width * 0.02)
                    .frame(maxWidth: geo.size.width, maxHeight: geo.size.width)
                    .background(self.color)
                    .overlay(
                        Circle()
                            .strokeBorder(self.color,lineWidth: geo.size.width * 0.12)
                            .colorMultiply(self.color.opacity(0.5))
                            .overlay(
                                Circle()
                                    .strokeBorder(self.isSelected ? Color.black : Color.white,lineWidth: geo.size.width * 0.05)))
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.15), radius: geo.size.width * 0.02, y: geo.size.width * -0.03)
                    .padding(geo.size.width * 0.05)
                //                        .scaleEffect(configuration.isPressed ? 0.5 : 1.0)
            }
        }
        
    }
}




struct ColoredButton_Previews: PreviewProvider {
    static var previews: some View {
        ColoredButton(table: 1, action: {
            // nothing
        }) {
            Text("1")
        }
    }
}
