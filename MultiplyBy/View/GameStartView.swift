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
    @EnvironmentObject var timesTables: TimesTablesViewModel
    
    var size: CGFloat  = 5
    
    var body: some View {
        ZStack {
            Color.lightWhite.edgesIgnoringSafeArea(.all)
            GeometryReader { geo in
                VStack(spacing: 30) {
                    
                    AppTitle()
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    NavigationLink(destination: GameTrainingView()) {
                        Text("StartTrainingButton")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(MainButtonStyle(foregroundColor: Color.lightWhite, backgroundColor: Color.table7, innerDarkShadow: .table7DarkShadow, innerLightShadow: .table7LightShadow))
                    .padding(.horizontal)
                    
                    
                    NavigationLink(destination: GameView()) {
                        Text("StartGameButton")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(MainButtonStyle( foregroundColor: Color.lightWhite, backgroundColor: Color.table5, innerDarkShadow: .table5DarkShadow, innerLightShadow: .table5LightShadow))
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    BackButton()
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
