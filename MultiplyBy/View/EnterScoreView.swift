//
//  EnterScoreView.swift
//  MultiplyBy
//
//  Created by megared on 02/06/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//
import CoreData
import SwiftUI

struct EnterScoreView: View {
    @Environment(\.presentationMode) var presentationMode
    var moc: NSManagedObjectContext
    
    var game: GameViewModel
    
    var body: some View {
        ZStack {
            Color.lightWhite
            
            VStack {
                Spacer()
                Group {
                    Text("MessageScore")
                    
                    Text(" \(self.game.score) ")
                        + Text("oneMinute")
                    Text("bad answers: \(self.game.badAnswer)")
                }
                .foregroundColor(.lightBlack)
                .roundedText(weight: .bold)
                
                Spacer()
                
                Button(action: {
                    let score = Score(context: self.moc)
                    score.id = UUID()
                    score.goodAnswer = Int64(self.game.score)
                    score.badAnswer = Int64(self.game.badAnswer)
                    score.date = Date()
                    try? self.moc.save()
                    
                    self.game.resetValue()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Ok")
                }
                .buttonStyle(MainButtonStyle(maxWidth: .infinity))
            }
            .padding()
            
        }
        .frame(maxWidth: 300, maxHeight: 300)
        .cornerRadius(10, antialiased: true)
        .modifier(SoftShadow())
        .padding()
    }
}

//struct EnterScoreView_Previews: PreviewProvider {
//    static var previews: some View {
//        EnterScoreView(timesTables: TimesTablesViewModel())
//    }
//}
