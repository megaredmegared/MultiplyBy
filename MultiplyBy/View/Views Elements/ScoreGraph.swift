//
//  scoreGraph.swift
//  MultiplyBy
//
//  Created by megared on 08/06/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct ScoreGraph: View {
    var scores: FetchedResults<Score>
    var maxHeight: CGFloat
    init(scores: FetchedResults<Score>, mostGoodAnswer: CGFloat, mostBadAnswer: CGFloat) {
        self.scores = scores
        
        if mostGoodAnswer >= mostBadAnswer {
            maxHeight = mostGoodAnswer
        } else {
            maxHeight = mostBadAnswer
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal) {
                HStack(alignment: .bottom) {
                    ForEach(self.scores, id: \.self) { score in
                        HStack(alignment: .bottom, spacing: 0) {
                            ZStack {
                                Rectangle()
                                    .fill(Color.table1)
                                    .frame(width: 20, height: geo.size.height / self.maxHeight * CGFloat(score.badAnswer))
                                
                                Text("\(score.badAnswer)")
                            }
                            ZStack {
                                Rectangle()
                                    .fill(Color.table4)
                                    .frame(width: 20, height: geo.size.height / self.maxHeight * CGFloat(score.goodAnswer))
                                
                                Text("\(score.goodAnswer)")
                            }
                        }
                        .roundedText(size: 8, weight: .black)
                        .foregroundColor(.lightWhite)
                        
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}

//struct scoreGraph_Previews: PreviewProvider {
//    static var previews: some View {
//        ScoreGraph(scores: Score(.))
//    }
//}
