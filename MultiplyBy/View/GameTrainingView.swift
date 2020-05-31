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
    @EnvironmentObject var timesTables: TimesTablesViewModel
    
    let colorScheme = AppColorScheme()
    
    var spacing: CGFloat = 4
    var textSize: CGFloat = 40
    
    @State var presentGameOverMessage = false
    @State var isGoodAnswer = true
    
    let isGameView = false
    
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                
                Color.lightWhite.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 2) {
                    
                    Spacer(minLength: 50)
                    //MARK: - Multiplication Question
                    HStack {
                        Text(self.timesTables.multiplicationQuestion.firstOperand)
                        Text(" x ")
                        Text(self.timesTables.multiplicationQuestion.secondOperand)
                    }
                    .roundedText(size: geo.size.height * 0.1, weight: .bold)
                    .foregroundColor(.table1)
                    .onAppear {
                        self.timesTables.pickNextMultiplication(tables: self.timesTables.choosenTables)
                    }
                    
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
                    
                    
                    //MARK: - Result help
                    if self.isGoodAnswer == false {
                        Group {
                            Text("AnswerIs:") + Text(" \(self.timesTables.multiplicationQuestion.result)")
                        }
                    } else {
                        Text(" ")
                    }
                    
                    Spacer()
                    
                    //MARK: - Numpad
                    NumPad(isGoodAnswer: self.$isGoodAnswer, isGameView: self.isGameView)
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
                    //                    .padding()
                    .edgesIgnoringSafeArea(.all)
                
            }
        }
        .deleteNavBar()
    }
}

struct GameTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        GameTrainingView()
    }
}
