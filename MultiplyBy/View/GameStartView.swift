//
//  GameStartView.swift
//  MultiplyBy
//
//  Created by megared on 03/05/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct GameStartView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var showGameView: Bool = false
    
    var body: some View {
        VStack {
            Text("AlertMessageForGameScore")
                .lineLimit(nil)
                
            
            Button(action: {
                self.showGameView.toggle()
            }) {
                Text("StartButtonLabel")
            }
            .sheet(isPresented: self.$showGameView) {
                GameView()
            }
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("CancelButtonLabel")
            }
        }
    }
}

struct GameStartView_Previews: PreviewProvider {
    static var previews: some View {
        GameStartView()
    }
}
