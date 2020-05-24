//
//  BackButton.swift
//  MultiplyBy
//
//  Created by megared on 16/05/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

/// Button to go backward in navigation between views
struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    var maxWidth: CGFloat? = .infinity
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Text("back")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(DefaultMainButtonStyle( foregroundColor: .lightWhite, backgroundColor: .table1))
        
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
