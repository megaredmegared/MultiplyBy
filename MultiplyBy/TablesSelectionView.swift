//
//  TablesSelectionView.swift
//  MultiplyBy
//
//  Created by megared on 22/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct TablesSelectionView: View {
    var timesTables: [Table]
    @Binding var choosenTables: [Table]
    
    var body: some View {
        VStack(spacing: 8) {
            GeometryReader { geo in
                ForEach(self.timesTables.chunked(into: 3), id: \.self) { row in
                    HStack(spacing: 8) {
                        ForEach(row, id: \.self) { table in
                            Button(action: {
                                self.addOrDeleteTable(of: table)
                                print("tables are: \(self.choosenTables.sorted(by: < ))")
                            }) {
                                Text("\(table.id)")
                            }
                            .buttonStyle(ButtonStyleColored(table: table.id, isSelected: self.choosenTables.contains(table)))
                            .frame(width: geo.size.width / 3.2)
                        }
                    }.frame(height: geo.size.width / 3.2)
                }
            }
            
        }
    }
    
    func addOrDeleteTable(of table: Table) {
        if choosenTables.contains(table) {
            choosenTables.removeAll { table == $0 }
        } else {
            choosenTables.append(table)
        }
    }
}

//struct TablesSelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        TablesSelectionView(timesTables: TimesTable().all, choosenTables: TimesTable().all)
//    }
//}
