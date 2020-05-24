//
//  TimesTable.swift
//  MultiplyBy
//
//  Created by megared on 28/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import Foundation

struct MultiplicationViewModel: Hashable, Codable {
    let firstOperand: String
    let secondOperand: String
    var result: String
}

struct TableViewModel: Identifiable, Comparable, Hashable, Codable {
    let id: Int
    var multiplications: [MultiplicationViewModel]
    
    init(of id: Int, numberOfTables: Int = 12) {
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

class TimesTables: ObservableObject {
    
    var all: [TableViewModel] = []
    
    @Published var choosenTables: [TableViewModel]
    // for test
    var count = 0
    
    init(numberOfTables: Int) {
        for number in 1...numberOfTables {
            all.append(TableViewModel(of: number, numberOfTables: numberOfTables))
        }
        
        // FIXME: make better solution with injection
        var test = all
        if let selectedTables = UserDefaults.standard.object(forKey: "selectedTables") as? Data {
            let decoder = JSONDecoder()
            if let tables = try? decoder.decode([TableViewModel].self, from: selectedTables) {
                test = tables
            }
        }
        self.choosenTables = test   
    }
    
    func addOrDeleteTable(of table: TableViewModel) {
        if choosenTables.contains(table) {
            choosenTables.removeAll { table == $0 }
        } else {
            choosenTables.append(table)
        }
    }
    
    func saveChoosenTables() {
        print("hello")
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(choosenTables) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "selectedTables")
        }
    }
    
    // for test
    func printed() {
        count += 1
        print("print is: \(count)")
    }
    
    func pickAMultiplication(tables: [TableViewModel]) -> MultiplicationViewModel? {
        let table = tables.randomElement()
        let multiplication = table?.multiplications.randomElement()
        print("\(String(describing: multiplication?.firstOperand)) x \(String(describing: multiplication?.secondOperand)) = \(String(describing: multiplication?.result))")
        return multiplication
    }
}

extension Multiplication {
    func convertMultiplicationToViewModel() -> MultiplicationViewModel {
        MultiplicationViewModel(firstOperand: String(self.firstOperand),
                                secondOperand: String(self.secondOperand),
                                result: String(self.result))
    }
}
