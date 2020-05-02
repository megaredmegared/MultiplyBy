//
//  TimesTable.swift
//  MultiplyBy
//
//  Created by megared on 28/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import Foundation

struct MultiplicationViewModel: Hashable {
    let firstOperand: String
    let secondOperand: String
    var result: String
}

struct TableViewModel: Identifiable, Comparable, Hashable {
    let id: Int
    var multiplications: [MultiplicationViewModel]
    
    init(of id: Int, numberOfTables: Int) {
        self.id = id
        let mutliplications = Table(of: id, numberOfTables: numberOfTables).multiplications
        
        self.multiplications = mutliplications.map { $0.convertMultiplicationToViewModel() }
    }
    
    static func < (lhs: TableViewModel, rhs: TableViewModel) -> Bool {
        lhs.id < rhs.id
    }
    static func == (lhs: TableViewModel, rhs: TableViewModel) -> Bool {
        lhs.id == rhs.id
    }
}

/// Timestables from 1 to 12
class TimesTables: ObservableObject {
    
    var all: [TableViewModel] = []
    
    @Published var choosenTables: [TableViewModel]
    
    init(numberOfTables: Int) {
        for number in 1...numberOfTables {
            all.append(TableViewModel(of: number, numberOfTables: numberOfTables))
        }
        
        self.choosenTables = all
    }
    
    func addOrDeleteTable(of table: TableViewModel) {
        if choosenTables.contains(table) {
            choosenTables.removeAll { table == $0 }
        } else {
            choosenTables.append(table)
        }
    }
}

extension Multiplication {
    func convertMultiplicationToViewModel() -> MultiplicationViewModel {
        MultiplicationViewModel(firstOperand: String(self.firstOperand),
                                secondOperand: String(self.secondOperand),
                                result: String(self.result))
    }
}
