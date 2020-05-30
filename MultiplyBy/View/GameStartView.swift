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
    
    var size: CGFloat  = 5
    
    var body: some View {
        ZStack {
            Color.lightWhite.edgesIgnoringSafeArea(.all)
            GeometryReader { geo in
                VStack(spacing: 30) {
                    AppTitle()
                        .frame(maxWidth: .infinity)
                    Group {
                        Spacer()
                    NavigationLink(destination: GameTrainingView()) {
                        Text("StartTrainingButton")
                        .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(DefaultMainButtonStyle(textSize: geo.size.width * 0.07, foregroundColor: Color.lightWhite, backgroundColor: Color.table7))
                    
                        NavigationLink(destination: GameView()) {
                        Text("StartGameButton")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(DefaultMainButtonStyle(textSize: geo.size.width * 0.07, foregroundColor: Color.lightWhite, backgroundColor: Color.table5))
                        
                    
                    Spacer()
                    
                    BackButton()
                    }
                    .padding()
                }
                .frame(maxWidth: 600)
            }
        }
        .deleteNavBar()
    }
}

struct GameStartView_Previews: PreviewProvider {
    static var previews: some View {
        GameStartView()
    }
}