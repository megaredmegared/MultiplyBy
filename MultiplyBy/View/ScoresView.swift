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
    
    var sortDescriptors: [NSSortDescriptor] = [
        NSSortDescriptor(keyPath: \Score.date, ascending: true)
    ]
    var fetchRequest: FetchRequest<Score>
    var scores: FetchedResults<Score> { fetchRequest.wrappedValue }
    
    @FetchRequest(entity: Score.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Score.goodAnswer, ascending: false)]) var mostGoodAnswer : FetchedResults<Score>
    
    @FetchRequest(entity: Score.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Score.badAnswer, ascending: false)]) var mostBadAnswer : FetchedResults<Score>
    
    init(){
        fetchRequest = FetchRequest<Score>(entity: Score.entity(), sortDescriptors: sortDescriptors, predicate: nil)
    }
    
    var body: some View {
        ZStack {
            Color.lightWhite.edgesIgnoringSafeArea(.all)
            GeometryReader { geo in
                VStack {
                    Text("Scores")
                        .roundedText(size: geo.size.width * 0.08, weight: .black)
                    VStack {
                        HStack {
                            Text("best score:")
                        }
                        
                        Text("\(self.mostGoodAnswer.first?.goodAnswer ?? 0)")
                            .foregroundColor(.table5)
                            + Text(" \(self.mostGoodAnswer.first?.badAnswer ?? 0)").foregroundColor(.table1)
                        
                        Text("Worst score:")
                        Text(" \(self.mostGoodAnswer.last?.goodAnswer ?? 0)").foregroundColor(.table5)
                            + Text(" \(self.mostGoodAnswer.last?.badAnswer ?? 0)").foregroundColor(.table1)
                        
                    }
                    .background(Color.lightWhite)
                    .roundedText(weight: .bold)
                    .foregroundColor(.lightBlack)
                    
                    ScoreGraph(mostGoodAnswer: CGFloat(Int(self.mostGoodAnswer.first?.goodAnswer ?? 0)), mostBadAnswer: CGFloat(Int(self.mostBadAnswer.first?.badAnswer ?? 0)), moc: self.moc, scores: self.scores)
                    
                    Spacer()
                    
                    
                    Button("add50") {
                        for _ in 0...1 {
                            let score = Score(context: self.moc)
                            score.id = UUID()
                            score.date = Date()
                            score.goodAnswer = Int64([10, 40, 35, 23, 0, 60, 55, 34].randomElement() ?? 0)
                            score.badAnswer = Int64([10, 12, 14, 20, 4, 0, 5, 7].randomElement() ?? 0)
                        }
                        try? self.moc.save()
                    }
                    
                    BackButton()
                    
                }
                .padding()
                .frame(maxWidth: 600)
            }

            EraseButton(moc: self.moc, scores: self.scores)
        }
        .deleteNavBar()
    }
}

struct ScoresView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return ScoresView()
            .environment(\.managedObjectContext, context)
        
    }
}
