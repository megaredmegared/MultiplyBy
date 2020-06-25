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
    @EnvironmentObject var game: GameViewModel
    
    var size: CGFloat  = 5
    
    var body: some View {
        ZStack {
            Color.lightWhite.edgesIgnoringSafeArea(.all)
            GeometryReader { geo in
                VStack(spacing: 30) {
                    
                    AppTitle()
                        .frame(maxWidth: .infinity)
                    
                    VStack {
                        Spacer()
                        NavigationLink(destination: GameTrainingView()) {
                            Text(Translation.startTrainingButtonLabel.rawValue)
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(MainButtonStyle(foregroundColor: Color.lightWhite, backgroundColor: Color.table7, innerDarkShadow: .table7DarkShadow, innerLightShadow: .table7LightShadow))
                        .opacity(self.game.choosenTables.isEmpty ? 0.2 : 1)
                        .disabled(self.game.choosenTables.isEmpty)
                        .padding(.bottom)
                        
                        NavigationLink(destination: GameView()) {
                            Text(Translation.startGameButtonLabel.rawValue)
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(MainButtonStyle( foregroundColor: Color.lightWhite, backgroundColor: Color.table5, innerDarkShadow: .table5DarkShadow, innerLightShadow: .table5LightShadow))
                        
                        Spacer()
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
