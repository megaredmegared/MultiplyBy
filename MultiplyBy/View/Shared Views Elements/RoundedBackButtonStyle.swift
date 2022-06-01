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
        GeometryReader { geo in
            VStack {
                HStack {
                    configuration.label
                        .frame(width: geo.size.width * 0.08, height: geo.size.width * 0.08)
                        .foregroundColor(.table1)
                        .padding()
                        .cornerRadius(cornerRadius)
                        .modifier(SoftShadow(isPressed: configuration.isPressed))
                    
                    Spacer()
                }
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
        }
        
    }
}

struct RoundedBackButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            //action
        }) {
           Image(systemName: "arrowtriangle.left.circle.fill")
            .resizable()
            .frame(width: 50, height:50)
        }
        .buttonStyle(RoundedBackButtonStyle())
    }
}
