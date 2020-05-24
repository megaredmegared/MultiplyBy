//
//  GameView.swift
//  MultiplyBy
//
//  Created by megared on 21/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var timesTables: TimesTables
    
    @State var score = 0
    @State var result: String = "0"
    
    let colorScheme = AppColorScheme()
    
    var spacing: CGFloat = 4
    var textSize: CGFloat = 40
    
    var multiplication: MultiplicationViewModel = MultiplicationViewModel(firstOperand: "0", secondOperand: "0", result: "0")
    
    func fetchMultiplication() -> MultiplicationViewModel {
        timesTables.pickAMultiplication(tables: timesTables.all)!
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                Color.lightWhite.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 2) {
                    
                    Text("00:47")
                        .roundedText(size: geo.size.width * 0.1, weight: .bold)
                        .foregroundColor(.lightBlack)
                    Text("score: \(self.score)")
                    HStack {
                        Text(self.multiplication.firstOperand)
                        Text(" x ")
                        Text(self.multiplication.secondOperand)
                    }
                    .roundedText(size: geo.size.width * 0.2, weight: .bold)
                    .foregroundColor(.table10)
                    
                    Text("\(self.result)")
                        .roundedText(size: geo.size.width * 0.2, weight: .bold)
                        .multilineTextAlignment(.center)
                        .background(Color.lightWhite)
                        .foregroundColor(.lightBlack)
                        .frame(maxWidth: .infinity)
                    
                    
                    NumPad(result: self.$result, score: self.$score, multiplication: self.multiplication)
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

