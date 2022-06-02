//
//  TimesTableTests.swift
//  MultiplyByTests
//
//  Created by megared on 15/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import MultiplyBy

class ModelTests: XCTestCase {

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {

    }

    func testMutliplicationOf3By2Result6() throws {

        let multiplicationOf3By2 = Multiplication(firstOperand: 3, secondOperand: 2)

        XCTAssertEqual(multiplicationOf3By2.result, 6)
        XCTAssertNotEqual(multiplicationOf3By2.result, 4)
    }

    func testCreateTableOf2() throws {
        let tableOf6 = Table(of: 2, numberOfTables: 12)

        // test number of mutltiplications
        XCTAssertEqual(tableOf6.multiplications.count, 12)
        // test of the 12 results
        XCTAssertEqual(tableOf6.multiplications[0].result, 2)
        XCTAssertEqual(tableOf6.multiplications[1].result, 4)
        XCTAssertEqual(tableOf6.multiplications[2].result, 6)
        XCTAssertEqual(tableOf6.multiplications[3].result, 8)
        XCTAssertEqual(tableOf6.multiplications[4].result, 10)
        XCTAssertEqual(tableOf6.multiplications[5].result, 12)
        XCTAssertEqual(tableOf6.multiplications[6].result, 14)
        XCTAssertEqual(tableOf6.multiplications[7].result, 16)
        XCTAssertEqual(tableOf6.multiplications[8].result, 18)
        XCTAssertEqual(tableOf6.multiplications[9].result, 20)
        XCTAssertEqual(tableOf6.multiplications[10].result, 22)
        XCTAssertEqual(tableOf6.multiplications[11].result, 24)

    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
