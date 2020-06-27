//
//  GameTrainingView.swift
//  MultiplyBy
//
//  Created by megared on 23/05/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct GameTrainingView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var game: GameViewModel
    
    let colorScheme = AppColorScheme()
    
    var spacing: CGFloat = 4
    var textSize: CGFloat = 40
    
    @State var presentGameOverMessage = false
    
    let isGameView = false
    
    var body: some View {
        ZStack {
            
            Color.lightWhite.edgesIgnoringSafeArea(.all)
            
            GeometryReader { geo in
                
                VStack {
                    
                    Spacer(minLength: 20)
                    //MARK: - Multiplication Question
                    MultiplicationQuestionView(geoSize: geo.size, gameType: .training)
                    
                    //MARK: - Multiplication Answer
                    MultiplicationAnswerView(geoSize: geo.size)
                        .padding(.bottom)
                    
                    //MARK: - Result help
                    if self.game.isGoodAnswer == false {
                        Group {
                            Text(Translation.trainingHelpAnswer.rawValue) + Text(" \(self.game.multiplicationQuestion.result)")
                                
                        }
                        .roundedText()
                    } else {
                        Text(" ")
                        .roundedText()
                    }
                    
                    Spacer(minLength: 20)
                    
                    //MARK: - Numpad
                    NumPad(geoSize: geo.size, isGameView: self.isGameView)
                }
            }
            .padding()
            //MARK: - Back button
            Button(action: {
                self.game.resetValue()
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrowtriangle.left.circle.fill")
                    .resizable()
            }
            .buttonStyle(RoundedBackButtonStyle())   
        }
        .deleteNavBar()
    }
}

struct GameTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        GameTrainingView()
            .environmentObject(GameViewModel())
    }
}
