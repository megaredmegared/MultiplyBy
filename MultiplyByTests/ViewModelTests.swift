//
//  TimesTablesTests.swift
//  MultiplyByTests
//
//  Created by megared on 02/05/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import MultiplyBy


class ViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: - MultiplicationViewModel
    
    func testGivenMultiplicationWhenConvertToViewModelThenMultiplicationViewModel() {
        let multiplication = Multiplication(firstOperand: 2, secondOperand: 3)
        
        let multiplicationViewModel = multiplication.convertMultiplicationToViewModel()
        
        XCTAssertEqual(multiplicationViewModel, MultiplicationViewModel(firstOperand: "2", secondOperand: "3", result: "6"))
        XCTAssertNotEqual(multiplicationViewModel, MultiplicationViewModel(firstOperand: "2", secondOperand: "3", result: "7"))
        
    }
    
    // MARK: - TableViewModel
    
    func testGivenNoTableWhenCreatingDefaultTableOf3AndTable4With3CalculationsThenTableOf3and4Exist() {
        let tableOf3 = TableViewModel(of: 3)
        let tableOf4 = TableViewModel(of: 4, numberOfTables: 3)
        
        XCTAssertEqual(tableOf3.multiplications.count, 12)
        XCTAssertEqual(tableOf3.multiplications[0].firstOperand, "3")
        XCTAssertEqual(tableOf3.multiplications[1].firstOperand, "3")
        XCTAssertEqual(tableOf3.multiplications[2].firstOperand, "3")
        XCTAssertEqual(tableOf3.multiplications[3].firstOperand, "3")
        XCTAssertEqual(tableOf3.multiplications[4].firstOperand, "3")
        XCTAssertEqual(tableOf3.multiplications[5].firstOperand, "3")
        XCTAssertEqual(tableOf3.multiplications[6].firstOperand, "3")
        XCTAssertEqual(tableOf3.multiplications[7].firstOperand, "3")
        XCTAssertEqual(tableOf3.multiplications[8].firstOperand, "3")
        XCTAssertEqual(tableOf3.multiplications[9].firstOperand, "3")
        XCTAssertEqual(tableOf3.multiplications[10].firstOperand, "3")
        XCTAssertEqual(tableOf3.multiplications[11].firstOperand, "3")
        XCTAssertEqual(tableOf3.multiplications[0].secondOperand, "1")
        XCTAssertEqual(tableOf3.multiplications[1].secondOperand, "2")
        XCTAssertEqual(tableOf3.multiplications[2].secondOperand, "3")
        XCTAssertEqual(tableOf3.multiplications[3].secondOperand, "4")
        XCTAssertEqual(tableOf3.multiplications[4].secondOperand, "5")
        XCTAssertEqual(tableOf3.multiplications[5].secondOperand, "6")
        XCTAssertEqual(tableOf3.multiplications[6].secondOperand, "7")
        XCTAssertEqual(tableOf3.multiplications[7].secondOperand, "8")
        XCTAssertEqual(tableOf3.multiplications[8].secondOperand, "9")
        XCTAssertEqual(tableOf3.multiplications[9].secondOperand, "10")
        XCTAssertEqual(tableOf3.multiplications[10].secondOperand, "11")
        XCTAssertEqual(tableOf3.multiplications[11].secondOperand, "12")
        XCTAssertEqual(tableOf3.multiplications[0].result, "3")
        XCTAssertEqual(tableOf3.multiplications[1].result, "6")
        XCTAssertEqual(tableOf3.multiplications[2].result, "9")
        XCTAssertEqual(tableOf3.multiplications[3].result, "12")
        XCTAssertEqual(tableOf3.multiplications[4].result, "15")
        XCTAssertEqual(tableOf3.multiplications[5].result, "18")
        XCTAssertEqual(tableOf3.multiplications[6].result, "21")
        XCTAssertEqual(tableOf3.multiplications[7].result, "24")
        XCTAssertEqual(tableOf3.multiplications[8].result, "27")
        XCTAssertEqual(tableOf3.multiplications[9].result, "30")
        XCTAssertEqual(tableOf3.multiplications[10].result, "33")
        XCTAssertEqual(tableOf3.multiplications[11].result, "36")
        
        XCTAssertEqual(tableOf4.multiplications.count, 3)
        XCTAssertEqual(tableOf4.multiplications[0].firstOperand, "4")
        XCTAssertEqual(tableOf4.multiplications[1].firstOperand, "4")
        XCTAssertEqual(tableOf4.multiplications[2].firstOperand, "4")
        XCTAssertEqual(tableOf4.multiplications[0].secondOperand, "1")
        XCTAssertEqual(tableOf4.multiplications[1].secondOperand, "2")
        XCTAssertEqual(tableOf4.multiplications[2].secondOperand, "3")
        XCTAssertEqual(tableOf4.multiplications[0].result, "4")
        XCTAssertEqual(tableOf4.multiplications[1].result, "8")
        XCTAssertEqual(tableOf4.multiplications[2].result, "12")
    }
    
    func testGivenTableOf2and4WhenCompareTablesThenNotEqualsAndTable2IsSmaller() {
        let tableOf2 = TableViewModel(of: 2)
        let tableOf4 = TableViewModel(of: 4)
        
        XCTAssertNotEqual(tableOf2, tableOf4)
        XCTAssertTrue(tableOf2 < tableOf4)
        XCTAssertFalse(tableOf2 > tableOf4)
    }
    
    func testGiven2TablesOf5WhenTestEquatableThenTrue() {
        let tableOf5 = TableViewModel(of: 5)
        let anOtherTableOf5 = TableViewModel(of: 5)
        
        XCTAssertTrue(tableOf5 == anOtherTableOf5)
        XCTAssertFalse(tableOf5 != anOtherTableOf5)
    }
    
    
    // MARK: - TimesTablesViewModel
    func testGivenNoTableWhenAddTableTill20ToViewModelThen20Timestables() throws {
      let game = GameViewModel(numberOfTables: 20)
        
        XCTAssertEqual(game.allTables.count, 20)
        
        XCTAssertEqual(game.allTables[2], TableViewModel(of: 3, numberOfTables: 20))
        XCTAssertNotEqual(game.allTables[2], TableViewModel(of: 3, numberOfTables: 12))
    }
    
    func testGivenMultiplicationQuestion0WhenNewQuestionThenNewQuestion() {
        let game = GameViewModel()
        let multiplicationQuestionStart = game.multiplicationQuestion
        XCTAssertEqual(multiplicationQuestionStart, MultiplicationViewModel(firstOperand: "0", secondOperand: "0", result: "0"))
        
        game.pickNextMultiplication(tables: game.allTables)
        
        let multiplicationQuestionRandom = game.multiplicationQuestion
        
        XCTAssertNotEqual(multiplicationQuestionRandom, MultiplicationViewModel(firstOperand: "0", secondOperand: "0", result: "0"))
        
    }
    
    func testGivenScorOf24andMultiplicationAnswerTo12WhenResetThenBothAt0() {
        let game = GameViewModel()
        game.score = 24
        game.multiplicationAnswer = "12"
        XCTAssertEqual(game.score, 24)
        XCTAssertNotEqual(game.score, 20)
        XCTAssertEqual(game.multiplicationAnswer, "12")
        XCTAssertNotEqual(game.multiplicationAnswer, "10")
        
        game.resetValue()
        
        XCTAssertEqual(game.score, 0)
        XCTAssertNotEqual(game.score, 20)
        XCTAssertEqual(game.multiplicationAnswer, "0")
        XCTAssertNotEqual(game.multiplicationAnswer, "10")
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
