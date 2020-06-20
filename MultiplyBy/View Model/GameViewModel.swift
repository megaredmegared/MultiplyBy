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
class GameViewModel: ObservableObject {
    
    var allTables: [TableViewModel] = []
    
    @Published var choosenTables: [TableViewModel]
    
    @Published var multiplicationQuestion: MultiplicationViewModel = MultiplicationViewModel(firstOperand: "0", secondOperand: "0", result: "0")
    
    @Published var multiplicationAnswer: String = "0"
    
    @Published var score = 0
    @Published var badAnswer = 0
    
    @Published var isGoodAnswer: Bool = true
    
    /// saveLey for user default
    static let defaultsSaveKey = "selectedTables"
    
    init(numberOfTables: Int = 12, userDefaults: UserDefaults = .standard) {
        for number in 1...numberOfTables {
            allTables.append(TableViewModel(of: number, numberOfTables: numberOfTables))
        }
        
        guard let selectedTables = userDefaults.object(forKey: Self.defaultsSaveKey) as? Data,
            let tables = try? JSONDecoder().decode([TableViewModel].self, from: selectedTables)
            else {
                self.choosenTables = allTables
                return
        }
        
        self.choosenTables = tables
        
    }
    
    /// reset score and multiplication values to default
    func resetValue() {
        score = 0
        badAnswer = 0
        multiplicationAnswer = "0"
        isGoodAnswer = true
    }
    
    /// add a table view or delete if already in the array
    func addOrDeleteTable(of table: TableViewModel) {
        if choosenTables.contains(table) {
            choosenTables.removeAll { table == $0 }
        } else {
            choosenTables.append(table)
        }
    }
    
    /// save choosen table and tell the view if ok with a bool
    func saveChoosenTables(userDefaults: UserDefaults = .standard) -> Bool {
        guard let encoded = try? JSONEncoder().encode(choosenTables) else {
            return false
        }
        userDefaults.set(encoded, forKey: Self.defaultsSaveKey)
        return true
    }
    
    func pickNextMultiplication(tables: [TableViewModel]) {
        guard let table = tables.randomElement(),
            let multiplication = table.multiplications.randomElement()
            else { return }
        
        self.multiplicationQuestion = multiplication
    }
}




