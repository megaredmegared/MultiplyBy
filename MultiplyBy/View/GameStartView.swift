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
            GeometryReader { _ in
                VStack {

                    AppTitle()
                        .frame(maxWidth: .infinity)

                    VStack {

                        Text("TrainMessage")
                            .roundedText(size: 15, weight: .bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.table7)
                            .padding(30)

                        NavigationLink(destination: GameTrainingView()) {
                            Text(Translation.startTrainingButtonLabel.rawValue)
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(MainButtonStyle(
                            foregroundColor: Color.lightWhite,
                            backgroundColor: Color.table7,
                            innerDarkShadow: .table7DarkShadow,
                            innerLightShadow: .table7LightShadow)
                        )
                        .opacity(game.choosenTables.isEmpty ? 0.2 : 1)
                        .disabled(game.choosenTables.isEmpty)
                        .padding(.bottom)

                        Text("PlayMessage")
                            .roundedText(size: 15, weight: .bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.table5)
                            .padding(30)

                        NavigationLink(destination: GameView()) {
                            Text(Translation.startGameButtonLabel.rawValue)
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(MainButtonStyle(
                            foregroundColor: Color.lightWhite,
                            backgroundColor: Color.table5,
                            innerDarkShadow: .table5DarkShadow,
                            innerLightShadow: .table5LightShadow)
                        )

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
        .statusBar(hidden: true) // iOS 14.0 fix
    }
}

struct GameStartView_Previews: PreviewProvider {
    static var previews: some View {
        GameStartView()
    }
}
