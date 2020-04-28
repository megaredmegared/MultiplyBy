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

    var body: some View {
        ZStack {
            Color.purple.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Game View")
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("back").font(.largeTitle).fontWeight(.bold).foregroundColor(.white)
                }
            }
        }
    }
}

//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView(), showingPlaySheet: Binding<Bool>
//    }
//}
