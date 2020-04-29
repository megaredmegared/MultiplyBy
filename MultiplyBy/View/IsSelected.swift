//
//  IsSelected.swift
//  MultiplyBy
//
//  Created by megared on 29/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct IsSelected: ViewModifier {
    var isSelected: Bool
    var modifier: EmptyModifier
    
    func body(content: Content) -> some View {
        VStack {
            if isSelected {
                content
                    .modifier(modifier)
            } else {
                content
            }
        }
    }
}

extension View {
    func isSelected(_ isSelected: Bool, modifier: EmptyModifier) -> some View {
        self.modifier(IsSelected(isSelected: isSelected, modifier: modifier))
    }
}
