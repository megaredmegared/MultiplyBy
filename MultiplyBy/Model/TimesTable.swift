//
//  Table.swift
//  MultiplyBy
//
//  Created by megared on 15/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import Foundation

struct Table: Identifiable, Hashable {
    let id: Int
    let multiplier: Int
    let index: Int
    
    var all: [Int] {
        var table: [Int] = []
        for number in 1...index {
            table.append(multiplier * number)
        }
        return table
    }
    
    init(of multiplier: Int, index: Int = 12) {
        self.id = multiplier
        self.multiplier = multiplier
        self.index = index
    }
}

extension String {
    func result() -> String {
        let number = self.components(separatedBy: " x ")
        var result  = 0
        if let firstNumber = Int(number[0]), let secondNumber = Int(number[1]){
            result = firstNumber * secondNumber
        }
        return String(result)
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
