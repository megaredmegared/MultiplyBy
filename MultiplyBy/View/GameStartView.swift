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
    @EnvironmentObject var timesTables: TimesTables
    
    
    var body: some View {
        ZStack {
            Color.lightWhite.edgesIgnoringSafeArea(.all)
            GeometryReader { geo in
                VStack(spacing: 30) {
                    
                    Spacer()
                    NavigationLink(destination: GameTrainingView()) {
                        Text("StartTrainingButton")
                    }
                    .buttonStyle(DefaultMainButtonStyle(textSize: geo.size.width * 0.07, cornerRadius: geo.size.width / 2, foregroundColor: Color.lightWhite, backgroundColor: Color.table7, maxWidth: geo.size.width / 2, maxHeight: geo.size.width / 2))
                    
                    NavigationLink(destination: GameView()) {
                        Text("StartGameButton")
                    }
                    .buttonStyle(DefaultMainButtonStyle(textSize: geo.size.width * 0.07, cornerRadius: geo.size.width / 2, foregroundColor: Color.lightWhite, backgroundColor: Color.table5, maxWidth: geo.size.width / 2, maxHeight: geo.size.width / 2))
                    
                    Spacer()
                    
                    BackButton()
                }
                .padding()
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
