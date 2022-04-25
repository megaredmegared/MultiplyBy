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
            VStack {
                LazyVGrid(columns: columns) {
                    ForEach(game.allTables, id: \.self) { table in
                        Button(action: {
                            self.game.addOrDeleteTable(of: table)
#if DEBUG
                            print("tables are: \(self.game.choosenTables.sorted(by: < ))")
#endif
                        }) {
                            Text("\(table.id)")
                        }
                        .buttonStyle(ButtonStyleColored(table: table.id, isSelected: self.game.choosenTables.contains(table)))
                        .frame(width: geo.size.width / 4, height: geo.size.width / 4)
                    }
                }
                .frame(maxWidth: geo.size.width / 4 * 3)
            }
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
