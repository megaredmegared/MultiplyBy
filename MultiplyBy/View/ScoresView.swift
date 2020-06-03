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

    @FetchRequest(entity: Leaderboard.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Leaderboard.score, ascending: false),
        NSSortDescriptor(keyPath: \Leaderboard.name, ascending: true)
    ]) var scores : FetchedResults<Leaderboard>
    var testScore: [Int64] =  [11, 12, 20, 45, 23, 50, 49]
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            Color.lightWhite.edgesIgnoringSafeArea(.all)
            GeometryReader { geo in
                VStack {
                    Text("leaderboard")
                        .roundedText(size: geo.size.width * 0.08, weight: .black)
                    
                    ScrollView {
                        VStack {
                            ForEach(self.scores, id: \.self) { score in
                                HStack(spacing: 5) {
                                    Text("\(score.score)")
                                        .frame(width: 30)
                                    Text("\(score.name ?? "unknown")")
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                            }
                        }
                    }
                    .background(Color.lightWhite)
                    .roundedText(weight: .bold)
                    .foregroundColor(.lightBlack)
                    
                    Spacer()
                    
                    Button(action: {
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
