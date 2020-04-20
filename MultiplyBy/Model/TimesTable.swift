//
//  Table.swift
//  MultiplyBy
//
//  Created by megared on 15/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import Foundation

struct Multiplication: Hashable {
    let firstOperand: Int
    let secondOperand: Int
    var result: Int {
        firstOperand * secondOperand
    }
}

struct Table: Identifiable, Hashable, Comparable {
    static func < (lhs: Table, rhs: Table) -> Bool {
        lhs.id < rhs.id
    }
    
    let id: Int
    let table: Int
    let multiplier: Int
    
    var all: [Multiplication] {
        var allMultiplications: [Multiplication] = []
        for number in 1...multiplier {
            allMultiplications.append(Multiplication(firstOperand: table, secondOperand: number))
        }
        return allMultiplications
    }
    
    init(of table: Int, multiplier: Int = 12) {
        self.id = table
        self.table = table
        self.multiplier = multiplier
    }
}

class TimesTables {
    let number: Int
    let range: [Int]
    
    var allTables: [Table] {
        var tables: [Table] = []
        for number in range {
            tables.append(Table(of: number))
        }
        return tables
    }
    
    init(number: Int) {
        self.number = number
        self.range = Array(1...number)
    }
}

//struct Table: Identifiable {
//    let id: Int
//    let multiplier: Int
//
//    subscript(index: Int) -> Int {
//        multiplier * index
//    }
//
//    init(of multiplier: Int) {
//    self.id = multiplier
//    self.multiplier = multiplier
//    }
//
//    func toString(index: Int) -> String {
//        "\(multiplier) x \(index)"
//    }
//}
//
//
//class TimesTables: Identifiable {
//    let number: Int
//    let range: [Int]
//
//    var all: [[String]] {
//        var tables: [[String]] = []
//        for i in range {
//            tables.append(range.map { "\(i) x \($0)" })
//        }
//        return tables
//    }
//
//    var allTables: [Table] {
//        var tables: [Table] = []
//        for number in range {
//            tables.append(Table(of: number))
//        }
//        return tables
//    }
//
//    static func result(of calcul: String) -> String {
//        let number = calcul.components(separatedBy: " x ")
//        var result  = 0
//        if let firstNumber = Int(number[0]), let secondNumber = Int(number[1]){
//            result = firstNumber * secondNumber
//        }
//        return String(result)
//    }
//
//    init(number: Int) {
//        self.number = number
//        self.range = Array(1...number)
//    }
//}
