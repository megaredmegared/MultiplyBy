//
//  RoundedBackButtonStyle.swift
//  MultiplyBy
//
//  Created by megared on 24/05/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

/// Button style for roundedBackButton
struct RoundedBackButtonStyle: ButtonStyle {
    
    var cornerRadius: CGFloat = 50
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.table1)
            .padding()
            .cornerRadius(self.cornerRadius)
            .modifier(SoftShadow(isPressed: configuration.isPressed))
    }
}
