//
//  ScoresView.swift
//  MultiplyBy
//
//  Created by megared on 28/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI
import CoreData

struct ScoresView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    
    
    /// sort by date for display it in the ScoreGraph view
    @FetchRequest<Score>(entity: Score.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Score.date, ascending: true)], predicate: nil) var scores: FetchedResults<Score>
    
    /// sort to make best score first
    @FetchRequest(entity: Score.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Score.goodAnswer, ascending: false), NSSortDescriptor(keyPath: \Score.badAnswer, ascending: true)]) var mostGoodAnswer : FetchedResults<Score>
    
    /// sort to make worst score first
    @FetchRequest(entity: Score.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Score.badAnswer, ascending: false), NSSortDescriptor(keyPath: \Score.goodAnswer, ascending: true)]) var mostBadAnswer : FetchedResults<Score>
    
    var averageScore: (Int?, Int?) {
        guard self.scores.count > 0 else {
            return (nil, nil)
        }
        
        var goodAnswers: Int64 = 0
        var badAnswers: Int64 = 0
        for score in self.scores {
            goodAnswers += score.goodAnswer
            badAnswers += score.badAnswer
        }
        let firstElement = (Int(goodAnswers) / scores.count)
        let secondElement = (Int(badAnswers) / scores.count)
        
        return (firstElement, secondElement)
    }
    
    var body: some View {
        ZStack {
            Color.lightWhite.edgesIgnoringSafeArea(.all)
            GeometryReader { geo in
                VStack {
                    Text(Translation.scoresViewTitle.rawValue)
                        .roundedText(size: geo.size.width * 0.08, weight: .black)
                    
                    Spacer(minLength: 20)
                    
                    VStack {
                        HStack {
                            Text(Translation.scoresViewBestScoreLabel.rawValue)
                        }
                        
                        Text("\(self.mostGoodAnswer.first?.goodAnswer ?? 0)")
                            .foregroundColor(.table5)
                            + Text(" \(self.mostGoodAnswer.first?.badAnswer ?? 0)").foregroundColor(.table1)
                        
                        Text(Translation.scoresViewWorstScoreLabel.rawValue)
                        Text(" \(self.mostGoodAnswer.last?.goodAnswer ?? 0)").foregroundColor(.table5)
                            + Text(" \(self.mostGoodAnswer.last?.badAnswer ?? 0)").foregroundColor(.table1)
                        
                        Text(Translation.scoresViewAverageScoreLabel.rawValue)
                        Text(" \(self.averageScore.0 ?? 0)").foregroundColor(.table5)
                            + Text(" \(self.averageScore.1 ?? 0)").foregroundColor(.table1)
                        
                    }
                    .background(Color.lightWhite)
                    .roundedText(weight: .bold)
                    .foregroundColor(.lightBlack)
                    
                    Spacer(minLength: 20)
                    
                    ScoreGraph(mostGoodAnswer: CGFloat(Int(self.mostGoodAnswer.first?.goodAnswer ?? 0)), mostBadAnswer: CGFloat(Int(self.mostBadAnswer.first?.badAnswer ?? 0)), moc: self.moc, scores: self.scores)
                        
                    
                    Spacer(minLength: 20)
                    
                    BackButton()
                    
                }
                .padding()
                
            }

            EraseButton(moc: self.moc, scores: self.scores)
        }
        .deleteNavBar()
        .statusBar(hidden: true) //iOS 14.0 fix
    }
}

struct ScoresView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return ScoresView()
            .environment(\.managedObjectContext, context)
        
    }
}
