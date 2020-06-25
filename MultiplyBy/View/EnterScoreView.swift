//
//  EnterScoreView.swift
//  MultiplyBy
//
//  Created by megared on 02/06/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//
import CoreData
import SwiftUI

extension HorizontalAlignment {
    struct BoxCenter: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[HorizontalAlignment.center]
        }
    }

    static let boxCenter = HorizontalAlignment(BoxCenter.self)
}

struct EnterScoreView: View {
    @Environment(\.presentationMode) var presentationMode
    var moc: NSManagedObjectContext
    
    var game: GameViewModel
    
    var body: some View {
        ZStack {
            Color.lightWhite
            
            VStack {
                Spacer()
                    
                VStack(alignment: .boxCenter) {
                    Text(Translation.gameOverScoreMessage.rawValue)
                    HStack {
                        HStack {
                            Image(systemName: "checkmark.circle")
                            Text("\(self.game.score)")
                                .lineLimit(.none)
                                .layoutPriority(1)
                            
                        }
                        .foregroundColor(.table5)
                        .alignmentGuide(.boxCenter) { d in d[HorizontalAlignment.trailing] }
                        
                        HStack {
                            Image(systemName: "multiply.circle")
                            Text("\(self.game.badAnswer)")
                                .lineLimit(.none)
                                .layoutPriority(1)
                        }
                        .foregroundColor(.table1)
                        .alignmentGuide(.boxCenter) { d in d[HorizontalAlignment.leading] }
                    }
                }
                .foregroundColor(.lightBlack)
                .roundedText(size: 30, weight: .bold)
                
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

struct EnterScoreView_Previews: PreviewProvider {
    static var previews: some View {
        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return  EnterScoreView(moc: moc, game: GameViewModel())
    }
}
