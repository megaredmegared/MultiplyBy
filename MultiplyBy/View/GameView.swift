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
    
    @State private var result = ""
    
    var body: some View {
        ZStack {
            Color.lightWhite.edgesIgnoringSafeArea(.all)
            
            
            VStack(spacing: 2) {
                Text("00:47")
                Text("3 x 3")
                TextField("0", text: $result)
                    .background(Color.white)
                    .frame(width: 200)
                    .padding()
                
                
                NumPad()
            }
        }
    }
    
}

//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView(), showingPlaySheet: Binding<Bool>
//    }
//}

struct GameButton: View {
    @Environment(\.colorScheme) var colorScheme
    private let size: CGFloat = 2
    @Binding var result: String
    let cornerRadius: CGFloat = 5
    let number: String
    
    var body: some View {
        Button(action: {
            self.result.append(self.number)
        }) {
            ZStack {

            Text(number)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.lightBlack)
                .background(Color.lightWhite)
                .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: 4)
                    .foregroundColor(.lightWhite)
                    .shadow(color: colorScheme == .dark
                        ? Color(.systemGray3).opacity(0.7)
                        : Color.primary.opacity(0.4),
                            radius: size, x: 1, y: 1)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    
                    .shadow(color: colorScheme == .dark
                        ? Color.black.opacity(0.8)
                        : .white, radius: 1.2, x: -1, y: -1)
                    
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                )
                
                RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(LinearGradient(gradient: Gradient(colors: [ .white, Color(.systemGray3).opacity(0.2)]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
                .padding(0.5)
                
                
            }

        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

