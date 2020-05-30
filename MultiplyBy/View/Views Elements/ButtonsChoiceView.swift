//
//  ButtonsChoiceView.swift
//  MultiplyBy
//
//  Created by megared on 28/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct ButtonsChoice: View {
    @EnvironmentObject var timesTables: TimesTablesViewModel
//    @Binding var choosenTables: [Table]
 
    var body: some View {
        GeometryReader { geo in
            VStack {
                ForEach(self.timesTables.allTables.chunked(into: 3), id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { table in
                            Button(action: {
                                self.timesTables.addOrDeleteTable(of: table)
                                print("tables are: \(self.timesTables.choosenTables.sorted(by: < ))")
                            }) {
                                Text("\(table.id)")
                            }
                            .buttonStyle(ButtonStyleColored(table: table.id, isSelected: self.timesTables.choosenTables.contains(table)))
                            .frame(maxWidth: geo.size.width / 4)
                        }
                    }.frame(maxHeight: geo.size.width / 4)
                }
            }
        }
    }
}

//struct ButtonsChoiceView_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonsChoiceView(timesTables: Tab, choosenTables: <#T##Binding<[Table]>#>)
//    }
//}