//
//  GameView.swift
//  MultiplyBy
//
//  Created by megared on 21/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI
import Combine

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    
    @EnvironmentObject var timesTables: TimesTablesViewModel
    
    let colorScheme = AppColorScheme()
    
    var spacing: CGFloat = 4
    var textSize: CGFloat = 40
    
    @State var showEnterScoreView = false
    @State var isGoodAnswer = true
    let isGameView = true
    @State var multiplicationAnswer2 = "0"
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                ZStack {
                    
                    Color.lightWhite.edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 2) {
                    
                        //MARK: - Timer
                        GameTimer(size: geo.size.height * 0.05, isOver: self.$showEnterScoreView)
                        
                        
                        //MARK: - Score
                        Text("score: \(self.timesTables.score)")
                        Spacer()
                        
                        //MARK: - Multiplication Question
                        HStack {
                            Text(self.timesTables.multiplicationQuestion.firstOperand)
                            Text(" x ")
                            Text(self.timesTables.multiplicationQuestion.secondOperand)
                        }
                        .roundedText(size: geo.size.height * 0.1, weight: .bold)
                        .foregroundColor(.table1)
                        .onAppear {
                            self.timesTables.pickNextMultiplication(tables: self.timesTables.allTables)
                        }
                        Spacer()
                        
                        //MARK: - Multiplication Answer
                        MultiplicationAnswerView(size: geo.size.height * 0.1, isGoodAnswer: self.$isGoodAnswer)
                        
                        //MARK: - Numpad
                        NumPad(isGoodAnswer: self.$isGoodAnswer, isGameView: self.isGameView)
                            .padding(.horizontal)
                        
                        Spacer()
                    }
                    .frame(maxWidth: 600)
                    
                    //MARK: - Back Button
                    VStack {
                        HStack {
                            Button(action: {
                                self.timesTables.resetValue()
                                self.presentationMode.wrappedValue.dismiss()
                            }) {
                                Image(systemName: "arrowtriangle.left.circle.fill")
                                    .resizable()
                                    .frame(width:
                                        UIDevice.current.userInterfaceIdiom == .pad ?
                                            geo.size.width * 0.03
                                            : geo.size.width * 0.08,
                                           height:
                                        UIDevice.current.userInterfaceIdiom == .pad ?
                                            geo.size.width * 0.03
                                            : geo.size.width * 0.08)
                            }
                            .buttonStyle(RoundedBackButtonStyle())
                            Spacer()
                        }
                        Spacer()
                    }
                    .edgesIgnoringSafeArea(.all)
                }
                .blur(radius: self.showEnterScoreView ? 10 : 0)
                
                //MARK: - Enter Score View
                if self.showEnterScoreView {
                    Color.lightWhite.opacity(0.5).edgesIgnoringSafeArea(.all)
                        .transition(.opacity)
                    EnterScoreView(moc: self.moc, timesTables: self.timesTables)
                    .transition(.scale)
                }
            }
        }
        .deleteNavBar()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}




