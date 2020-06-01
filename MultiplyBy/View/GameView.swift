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
//    @EnvironmentObject var timesTables: TimesTablesViewModel
    var timesTables: TimesTablesViewModel
    
    let colorScheme = AppColorScheme()
    
    var spacing: CGFloat = 4
    var textSize: CGFloat = 40
    
    // Countdown Timer
    @State var timeRemaining = 60 // seconds
    @State var isActive = true
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var presentGameOverMessage = false
    @State var isGoodAnswer = true
    let isGameView = true
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                
                Color.lightWhite.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 2) {
                    
                    
                    //MARK: - Timer
                    Text("\(self.timeRemaining)")
                        .roundedText(size: geo.size.height * 0.05, weight: .bold)
                        .foregroundColor(.lightBlack)
                        .onReceive(self.timer) { _ in
                            guard self.isActive else { return }
                            if self.timeRemaining > 0 {
                                self.timeRemaining -= 1
                            }
                            else if self.timeRemaining == 0 {
                                self.timer.upstream.connect().cancel()
                                self.isActive = false
                                self.presentGameOverMessage.toggle()
                            }
                    }
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                        self.isActive = false
                    }
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
                        self.isActive = true
                    }
                        //MARK: - Game Over message
                        .alert(isPresented: self.$presentGameOverMessage) {
                            Alert.init(title: Text("GameOver"), message: Text("GameOverMessage \(self.timesTables.score)"), dismissButton: .default(Text("back"), action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }))
                    }
                    
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
                    Text("\(self.timesTables.multiplicationAnswer)")
                        .truncationMode(.head)
                        .roundedText(size: geo.size.height * 0.1, weight: .bold)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                        .foregroundColor(.lightBlack)
                        .modifier(SoftShadow())
                        .frame(maxWidth: .infinity)
                        .background(self.isGoodAnswer ? Color.lightWhite : Color.table1)
                        .cornerRadius(5)
                        .padding(.horizontal)

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
                            self.timesTables.score = 0
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
        }
        .deleteNavBar()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(timesTables: TimesTablesViewModel())
    }
}

