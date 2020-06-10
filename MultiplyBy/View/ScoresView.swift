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
    
    @State private var presentEraseMessage = false
    
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
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        self.presentEraseMessage.toggle()
                    }) {
                        Text("erase")
                            .foregroundColor(.lightBlack)
                    }
                }
                Spacer()
            }.padding()
            .edgesIgnoringSafeArea(.all)
                .alert(isPresented: $presentEraseMessage) {
                    Alert(title: Text("Erase all?"), primaryButton: Alert.Button.cancel(), secondaryButton: .default(Text("Ok"), action: {
                        guard !self.scores.isEmpty else {
                            return
                        }
                        for number in 0..<self.scores.count {
                            self.moc.delete(self.scores[number])
                        }
                        try? self.moc.save()
                    }))
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
