//
//  scoreGraph.swift
//  MultiplyBy
//
//  Created by megared on 08/06/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI
import CoreData

extension View {
    public func flip() -> some View {
        return self
            .rotationEffect(.radians(.pi))
            .scaleEffect(x: 1, y: -1, anchor: .center)
    }
}

struct ScoreGraph: View {
    var scores: FetchedResults<Score>

    var maxHeight: CGFloat

    init(mostGoodAnswer: CGFloat, mostBadAnswer: CGFloat, scores: FetchedResults<Score>) {
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
                    ForEach(scores, id: \.self) { score in
                        HStack(alignment: .bottom, spacing: 0) {
                            ZStack {
                                Rectangle()
                                    .fill(Color.table5)
                                    .frame(width: 20, height: geo.size.height / maxHeight * CGFloat(score.goodAnswer))

                                Text("\(score.goodAnswer)")
                            }
                            ZStack {
                                Rectangle()
                                    .fill(Color.table1)
                                    .frame(width: 20, height: geo.size.height / maxHeight * CGFloat(score.badAnswer))

                                Text("\(score.badAnswer)")
                            }
                        }
                        .roundedText(size: 8, weight: .black)
                        .foregroundColor(.lightWhite)
                        .background(Color.gray.opacity(0.1))
                    }
                }
                .flip()
            }
            .flip()
        }
        .frame(maxWidth: .infinity)
    }
}
