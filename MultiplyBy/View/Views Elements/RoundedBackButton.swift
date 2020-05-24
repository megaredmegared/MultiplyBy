//
//  RoundedBackButton.swift
//  MultiplyBy
//
//  Created by megared on 23/05/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct RoundedBackButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    var width: CGFloat = 20
    var height: CGFloat = 20
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrowtriangle.left.circle.fill")
            .resizable()
                .frame(width: self.width, height: self.height)
        }
        .buttonStyle(RoundedBackButtonStyle())
        
    }
}

struct RoundedBackButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedBackButton()
    }
}
