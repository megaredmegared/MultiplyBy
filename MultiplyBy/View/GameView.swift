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
    @EnvironmentObject var timesTables: TimesTablesViewModel
    
    @State var score = 0
    
    let colorScheme = AppColorScheme()
    
    var spacing: CGFloat = 4
    var textSize: CGFloat = 40
    
    // Countdown Timer
    @State var timeRemaining = 60 // seconds
    @State var isActive = true
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var presentGameOverMessage = false
    
//    var multiplication: MultiplicationViewModel
    
//    init(timesTables: TimesTablesViewModel) {
//        self.timesTables = timesTables
//        self.multiplication = timesTables.multiplicationQuestion
//    }
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                
                Color.lightWhite.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 2) {
                    
                    Group {
                        //MARK: - Timer
                        Text("\(self.timeRemaining)")
                            .roundedText(size: geo.size.width * 0.1, weight: .bold)
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
                        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                            self.isActive = true
                        }
                            //MARK: - Game Over message
                            .alert(isPresented: self.$presentGameOverMessage) {
                                Alert.init(title: Text("GameOver"), message: Text("GameOverMessage \(self.score)"), dismissButton: .default(Text("go back home"), action: {
                                    self.presentationMode.wrappedValue.dismiss()
                                }))
                        }
                        
                        //MARK: - Score
                        Text("score: \(self.score)")
                        
                        //MARK: - Multiplication Question
                        HStack {
                            Text(self.timesTables.multiplicationQuestion.firstOperand)
                            Text(" x ")
                            Text(self.timesTables.multiplicationQuestion.secondOperand)
                        }
                        .roundedText(size: geo.size.width * 0.2, weight: .bold)
                        .foregroundColor(.table1)
                        .onAppear {
                            self.timesTables.pickNextMultiplication(tables: self.timesTables.allTables)
                        }
                        
                        //MARK: - Multiplication Answer
                        Text("\(self.timesTables.multiplicationAnswer)")
                            .truncationMode(.head)
                            .roundedText(size: geo.size.width * 0.2, weight: .bold)
                            .multilineTextAlignment(.center)
                            .lineLimit(1)
                            .foregroundColor(.lightBlack)
                            .frame(maxWidth: .infinity)
                        
                    }
                    .modifier(SoftShadow())
                    
                    //MARK: - Numpad
                    NumPad(score: self.$score)
                        .padding()
                    
                    Spacer()
                }
                .frame(maxWidth: 600)
                
                VStack {
                    HStack {
                        RoundedBackButton( width: geo.size.width * 0.08, height: geo.size.width * 0.08)
                        Spacer()
                    }
                    Spacer()
                }
                .padding()
                .edgesIgnoringSafeArea(.all)
                
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

