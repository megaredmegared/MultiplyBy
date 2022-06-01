//
//  MultiplicationAnswerView.swift
//  MultiplyBy
//
//  Created by megared on 10/06/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct MultiplicationAnswerView: View {
    @EnvironmentObject var game: GameViewModel
    var geoSize: CGSize
    
    var body: some View {
            HStack {
            Text("\(game.multiplicationAnswer)")
                .truncationMode(.head)
                .roundedText(size: geoSize.width * 0.25, weight: .bold)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .foregroundColor(.lightBlack)
                .if(game.isGoodAnswer) {
                    $0.modifier(SoftShadow())
            }
            .frame(maxWidth: .infinity)
            .background(game.isGoodAnswer ? Color.clear : Color.table1)
            .cornerRadius(5)
            }
    }
}

struct MultiplicationAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplicationAnswerView(geoSize: CGSize(width: 300, height: 300))
            .environmentObject(GameViewModel())
    }
}
