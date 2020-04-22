//
//  TimesTableTests.swift
//  MultiplyByTests
//
//  Created by megared on 15/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import MultiplyBy

class TimesTableTests: XCTestCase {
    
    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
       
    }

    func testMutliplicationOf3By2Result6() throws {
        
        let multiplicationOf3By2 = Multiplication(firstOperand: 3, secondOperand: 2)
        
        XCTAssertEqual(multiplicationOf3By2.result, 6)
    }
    
    func testCreateTableOf2() throws {
        let tableOf6 = Table(of: 2, numberOfTables: 12)
        
        // test number of mutltiplications
        XCTAssertEqual(tableOf6.all.count, 12)
        // test of the 12 results
        XCTAssertEqual(tableOf6.all[0].result, 2)
        XCTAssertEqual(tableOf6.all[1].result, 4)
        XCTAssertEqual(tableOf6.all[2].result, 6)
        XCTAssertEqual(tableOf6.all[3].result, 8)
        XCTAssertEqual(tableOf6.all[4].result, 10)
        XCTAssertEqual(tableOf6.all[5].result, 12)
        XCTAssertEqual(tableOf6.all[6].result, 14)
        XCTAssertEqual(tableOf6.all[7].result, 16)
        XCTAssertEqual(tableOf6.all[8].result, 18)
        XCTAssertEqual(tableOf6.all[9].result, 20)
        XCTAssertEqual(tableOf6.all[10].result, 22)
        XCTAssertEqual(tableOf6.all[11].result, 24)
        
    }
    
    func testAddTableOf3ThenTableOf1ThenSortedTable1IsFirstInTheArray() throws {
        let tableOf1 = Table(of: 1, numberOfTables: 12)
        let tableOf3 = Table(of: 3, numberOfTables: 12)
        var arrayOfTables: [Table] = []
        
        arrayOfTables.append(tableOf3)
        arrayOfTables.append(tableOf1)
        arrayOfTables.sort()
        
        XCTAssertEqual(arrayOfTables[0], tableOf1)
        XCTAssertEqual(arrayOfTables[1], tableOf3)
    }
    
    func testCreationOfAllTablesFrom1To12() throws {
        let timesTables = TimesTable()
        
        XCTAssertEqual(timesTables.all.count, 12)
        XCTAssertEqual(timesTables.all[0], Table(of: 1, numberOfTables: 12))
        XCTAssertEqual(timesTables.all[1], Table(of: 2, numberOfTables: 12))
        XCTAssertEqual(timesTables.all[2], Table(of: 3, numberOfTables: 12))
        XCTAssertEqual(timesTables.all[3], Table(of: 4, numberOfTables: 12))
        XCTAssertEqual(timesTables.all[4], Table(of: 5, numberOfTables: 12))
        XCTAssertEqual(timesTables.all[5], Table(of: 6, numberOfTables: 12))
        XCTAssertEqual(timesTables.all[6], Table(of: 7, numberOfTables: 12))
        XCTAssertEqual(timesTables.all[7], Table(of: 8, numberOfTables: 12))
        XCTAssertEqual(timesTables.all[8], Table(of: 9, numberOfTables: 12))
        XCTAssertEqual(timesTables.all[9], Table(of: 10, numberOfTables: 12))
        XCTAssertEqual(timesTables.all[10], Table(of: 11, numberOfTables: 12))
        XCTAssertEqual(timesTables.all[11], Table(of: 12, numberOfTables: 12))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
