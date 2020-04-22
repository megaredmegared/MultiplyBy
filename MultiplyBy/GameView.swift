//
//  GameView.swift
//  MultiplyBy
//
//  Created by megared on 21/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
    private var cornerRadius: CGFloat = 8
    @State private var presentSheet = false
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(Color.red)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.blue, lineWidth: 8)
                    
            ).edgesIgnoringSafeArea(.all)
            
            
            VStack {
                Text("Correct")
                Text("3 x 12")
                Text("=")
                Text("36")
                Button(action: {
                    self.presentSheet.toggle()
                }) {
                    Text("more")
                }
                
                Button("back") {
                    self.presentationMode.wrappedValue.dismiss()
                }.shadow(color: .red, radius: 5, x: 0, y: -5)
            }.shadow(color: .red, radius: 5, x: 0, y: -5)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
