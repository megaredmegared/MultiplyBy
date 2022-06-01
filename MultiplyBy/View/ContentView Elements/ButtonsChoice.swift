//
//  ButtonsChoiceView.swift
//  MultiplyBy
//
//  Created by megared on 28/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

/// Buttons for choosing tables
struct ButtonsChoice: View {
    @EnvironmentObject var game: GameViewModel
    @State private var offset = CGSize.zero
    
    let columns =  [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        GeometryReader { geo in
                LazyVGrid(columns: columns) {
                    ForEach(game.allTables, id: \.self) { table in
                        Button(action: {
                            game.addOrDeleteTable(of: table)
#if DEBUG
                            print("tables are: \(game.choosenTables.sorted(by: < ))")
#endif
                        }) {
                            Text("\(table.id)")
                        }
                        .buttonStyle(ButtonStyleColored(table: table.id, isSelected: game.choosenTables.contains(table)))
                        .frame(width: geo.size.width / 4, height: geo.size.width / 4)
                    }
                }
                .padding(.horizontal, geo.size.width / 8)
                // FIXME: - Quick fix for geometry reader content no more centered on ios 14
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct ButtonsChoiceView_Previews: PreviewProvider {
    
    static var previews: some View {
        ButtonsChoice()
            .environmentObject(GameViewModel())
    }
}
