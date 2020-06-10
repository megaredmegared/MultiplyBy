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
 
    var body: some View {
        GeometryReader { geo in
            VStack {
                ForEach(self.game.allTables.chunked(into: 3), id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { table in
                            Button(action: {
                                self.game.addOrDeleteTable(of: table)
                                print("tables are: \(self.game.choosenTables.sorted(by: < ))")
                            }) {
                                Text("\(table.id)")
                            }
                            .buttonStyle(ButtonStyleColored(table: table.id, isSelected: self.game.choosenTables.contains(table)))
                            .frame(maxWidth: geo.size.width / 4)
                        }
                    }.frame(maxHeight: geo.size.width / 4)
                }
            }
        }
    }
}
