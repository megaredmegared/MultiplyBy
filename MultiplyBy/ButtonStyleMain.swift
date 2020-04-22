//
//  ButtonStyleMain.swift
//  MultiplyBy
//
//  Created by megared on 21/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI


/// Button style for mains buttons
struct ButtonStyleMain: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .foregroundColor(.black)
    }
}

struct ButtonStyleMain_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
                   // void
               }) {
                   Text("test")
               }.buttonStyle(ButtonStyleMain())
        
    }
}
