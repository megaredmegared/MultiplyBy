//
//  ButtonStyleMain.swift
//  MultiplyBy
//
//  Created by megared on 21/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI


/// Button style for mains buttons
struct ButtonStyleNavigation: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .roundedText(size: 20, weight: .bold)
            .foregroundColor(.lightBlack)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background(Color.lightWhite)
            .clipShape(RoundedRectangle(cornerRadius: 9))
            .padding(.horizontal, 1)
            .padding(.vertical, 1)
            .background(LinearGradient(
                gradient: Gradient(colors: [.lightWhite, .fullWhite]),
                startPoint: .topLeading, endPoint: .bottomTrailing))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .softShadow()
    }
}

struct ButtonStyleMain_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
                   // void
               }) {
                   Text("test")
               }.buttonStyle(ButtonStyleNavigation())
    }
}
