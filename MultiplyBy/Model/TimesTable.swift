//
//  Table.swift
//  MultiplyBy
//
//  Created by megared on 15/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import Foundation

/// basic mutliplication
struct Multiplication: Hashable {
    let firstOperand: Int
    let secondOperand: Int
    var result: Int {
        firstOperand * secondOperand
    }
}

/// Array of mutliplication given a number
struct Table: Identifiable, Hashable, Comparable {
    
    let id: Int
    let table: Int
    let numberOfTables: Int
    
    var all: [Multiplication] {
        var allMultiplications: [Multiplication] = []
        for number in 1...numberOfTables {
            allMultiplications.append(Multiplication(firstOperand: table, secondOperand: number))
        }
        return allMultiplications
    }
    
    init(of table: Int, numberOfTables: Int) {
        self.id = table
        self.table = table
        self.numberOfTables = numberOfTables
    }
    
    /// Make Table Comparable
    static func < (lhs: Table, rhs: Table) -> Bool {
        lhs.id < rhs.id
    }
}

/// Timestables from 1 to 12
class TimesTable {
    let numberOfTables = 12
    
    var all: [Table] {
        var tables: [Table] = []
        for number in 1...numberOfTables {
            tables.append(Table(of: number, numberOfTables: numberOfTables))
        }
        return tables
    }
}
