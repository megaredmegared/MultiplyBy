//
//  Table.swift
//  MultiplyBy
//
//  Created by megared on 15/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import Foundation

struct Table {
    let multiplier: Int
    subscript(index: Int) -> Int {
        multiplier * index
    }
    init(of multiplier: Int) {
    self.multiplier = multiplier
    }
    
    func multiplierString() -> String {
        "\(multiplier) x \(index)"
    }
}


//let threeTimesTable = TimesTable(multiplier: 3)
//print("six times three is \(threeTimesTable[6])")
//// Prints "six times three is 18"
////-----------------------------------
//
//for i in 1...10 {
//    for j in 1...10 {
//        let product = i * j
//        print ("\(i) * \(j) is \(product)")
//    }
//}

class TimesTables: Identifiable {
    let number: Int
    
    var all: [[String]] {
        let range = 1...number
        var tables: [[String]] = []
        for i in range {
            tables.append(range.map { "\(i) x \($0)" })
        }
        return tables
    }
    
    static func result(of calcul: String) -> String {
        let number = calcul.components(separatedBy: " x ")
        var result  = 0
        if let firstNumber = Int(number[0]), let secondNumber = Int(number[1]){
            result = firstNumber * secondNumber
        }
        return String(result)
    }
    
    init(number: Int) {
        self.number = number
    }
}
