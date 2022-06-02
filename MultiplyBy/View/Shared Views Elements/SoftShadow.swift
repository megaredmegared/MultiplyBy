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
    var size: CGFloat = 2
    var isPressed: Bool = false

    func body(content: Content) -> some View {
        content
            .shadow(color: Color.blackShadow
                .opacity(isPressed ? 0 : 1),
                    radius: size, x: size, y: size)

            .shadow(color: Color.whiteShadow
                .opacity(isPressed ? 0 : 1),
            radius: size, x: -size, y: -size)
    }

}

struct SoftShadow_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
            .frame(width: 100, height: 100)
            .background(Color.lightWhite)
            .modifier(SoftShadow())
    }
}
