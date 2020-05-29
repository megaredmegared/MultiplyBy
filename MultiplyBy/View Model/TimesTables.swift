//
//  TimesTable.swift
//  MultiplyBy
//
//  Created by megared on 28/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import Foundation

extension Multiplication {
    /// Transform Mutliplication Object into MultiplicationViewModel Oject
    func convertMultiplicationToViewModel() -> MultiplicationViewModel {
        MultiplicationViewModel(firstOperand: String(self.firstOperand),
                                secondOperand: String(self.secondOperand),
                                result: String(self.result))
    }
}

/// Object that represent a multiplication ready to be presented to a view
struct MultiplicationViewModel: Hashable, Codable {
    let firstOperand: String
    let secondOperand: String
    var result: String
}

/// Object that represent a multiplication table ready for use with a view
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
        if lhs.id == rhs.id && lhs.multiplications == rhs.multiplications {
            return true
        }
        return false
    }
}

/// Object that give data for the game
class TimesTablesViewModel: ObservableObject {
    
    var all: [TableViewModel] = []
    
    @Published var choosenTables: [TableViewModel]

    @Published var multiplicationQuestion: MultiplicationViewModel
    
    
    init(numberOfTables: Int) {
        for number in 1...numberOfTables {
            all.append(TableViewModel(of: number, numberOfTables: numberOfTables))
        }
        var test = all
        if let selectedTables = UserDefaults.standard.object(forKey: "selectedTables") as? Data {
            let decoder = JSONDecoder()
            if let tables = try? decoder.decode([TableViewModel].self, from: selectedTables) {
                test = tables
            }
        }
        
        self.choosenTables = test
        self.multiplicationQuestion = TimesTablesViewModel.pickAMultiplication(tables: all)!
    }
    
    func addOrDeleteTable(of table: TableViewModel) {
        if choosenTables.contains(table) {
            choosenTables.removeAll { table == $0 }
        } else {
            choosenTables.append(table)
        }
    }
    
    //FIXME: better to throws errors??
    func saveChoosenTables() -> Bool {
        print("hello")
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(choosenTables) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "selectedTables")
            return true
        }
        return false
    }
    
    func pickNextMultiplication(tables: [TableViewModel]) {
        self.multiplicationQuestion = TimesTablesViewModel.pickAMultiplication(tables: all)!
    }
    
    static func pickAMultiplication(tables: [TableViewModel]) -> MultiplicationViewModel? {
        let table = tables.randomElement()
        let multiplication = table?.multiplications.randomElement()
        print("\(String(describing: multiplication?.firstOperand)) x \(String(describing: multiplication?.secondOperand)) = \(String(describing: multiplication?.result))")
        return multiplication
    }
}




