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
 
    var body: some View {
        GeometryReader { geo in
            VStack {
                ForEach(self.game.allTables.chunked(into: 3), id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { table in
                            Button(action: {
                                self.game.addOrDeleteTable(of: table)
                                #if DEBUG
                                print("tables are: \(self.game.choosenTables.sorted(by: < ))")
                                #endif
                            }) {
                                Text("\(table.id)")
                            }
                            .transition(.scale)
//                            .highPriorityGesture(
//                                DragGesture()
//                                    .onChanged { gesture in
//                                        self.offset = gesture.translation
//                                }
//
//                                .onEnded { _ in
//                                    if abs(self.offset.width) > 10 {
//                                        // remove the card
//                                    } else {
//                                        self.offset = .zero
//                                    }
//                                }
//                            )
                                .buttonStyle(ButtonStyleColored(table: table.id, isSelected: self.game.choosenTables.contains(table)))
                            
                            .frame(maxWidth: geo.size.width / 4)
                        }
                    }.frame(maxHeight: geo.size.width / 4)
                }
            }
            // FIXME: - Quick fix for geometry reader content no more centered on ios 14
            .frame(width: geo.size.width, height: geo.size.height)
            
        }
    }
}

struct ButtonsChoiceView_Previews: PreviewProvider {
    
    static var previews: some View {
       ButtonsChoice()
        .environmentObject(GameViewModel())
    }
}
