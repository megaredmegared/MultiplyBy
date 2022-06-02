//
//  Table.swift
//  MultiplyBy
//
//  Created by megared on 15/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import Foundation

/// Basic mutliplication
struct Multiplication {
    let firstOperand: Int
    let secondOperand: Int
    var result: Int {
        firstOperand * secondOperand
    }
}

/// Array of mutliplications given a number
struct Table {
    let table: Int
    let numberOfTables: Int

    var multiplications: [Multiplication] {
        var allMultiplications: [Multiplication] = []
        for number in 1...numberOfTables {
            allMultiplications.append(Multiplication(firstOperand: table, secondOperand: number))
        }
        return allMultiplications
    }

    init(of table: Int, numberOfTables: Int) {
        self.table = table
        self.numberOfTables = numberOfTables
    }
}
