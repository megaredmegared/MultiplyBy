//
//  TimesTable.swift
//  MultiplyBy
//
//  Created by megared on 28/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import Foundation

/// Timestables from 1 to 12
class TimesTables: ObservableObject {

    var all: [Table]
    
    @Published var choosenTables: [Table]
    
    init(numberOfTables: Int = 12) {
        self.all = Tables(numberOfTables: numberOfTables).all
        self.choosenTables = Tables(numberOfTables: numberOfTables).all
    }
    
    func addOrDeleteTable(of table: Table) {
        if choosenTables.contains(table) {
            choosenTables.removeAll { table == $0 }
        } else {
            choosenTables.append(table)
        }
    }
}
