//
//  ScoresView.swift
//  MultiplyBy
//
//  Created by megared on 28/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct ScoresView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: Score.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Score.date, ascending: true)
    ]) var scores : FetchedResults<Score>
    
    @FetchRequest(entity: Score.entity(), sortDescriptors: [
    NSSortDescriptor(keyPath: \Score.goodAnswer, ascending: false)]) var mostGoodAnswer : FetchedResults<Score>
    
    @FetchRequest(entity: Score.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Score.badAnswer, ascending: false)]) var mostBadAnswer : FetchedResults<Score>
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            Color.lightWhite.edgesIgnoringSafeArea(.all)
            GeometryReader { geo in
                VStack {
                    Text("Scores")
                        .roundedText(size: geo.size.width * 0.08, weight: .black)
                    VStack {
                        Text("best score:")
                        Text("Correct: \(self.mostGoodAnswer.first?.goodAnswer ?? 0)")
                            + Text(" Wrong: \(self.mostGoodAnswer.first?.badAnswer ?? 0)")
                        
                        Text("Worst score:")
                        Text("Correct: \(self.mostGoodAnswer.last?.goodAnswer ?? 0)")
                            + Text(" Wrong: \(self.mostGoodAnswer.last?.badAnswer ?? 0)")
                        
                    }
                    .background(Color.lightWhite)
                    .roundedText(weight: .bold)
                    .foregroundColor(.lightBlack)
                    
                    ScoreGraph(scores: self.scores,
                               mostGoodAnswer: CGFloat(Int(self.mostGoodAnswer.first?.goodAnswer ?? 0)),
                               mostBadAnswer: CGFloat(Int(self.mostBadAnswer.first?.badAnswer ?? 0)))
                        .padding(.vertical)
                    
                    Spacer()
                    
                    Button(action: {
                        guard !self.scores.isEmpty else {
                            return
                        }
                        self.moc.delete(self.scores[0])
                        try? self.moc.save()
                    }) {
                        Text("deletdata")
                    }
                    
                    BackButton()
                    
                }
                .padding()
                .frame(maxWidth: 600)
            }
        }
        .deleteNavBar()
    }
}

struct ScoresView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresView()
    }
}
