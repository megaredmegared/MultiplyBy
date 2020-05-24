//
//  TimesTablesTests.swift
//  MultiplyByTests
//
//  Created by megared on 02/05/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import MultiplyBy


class TimesTablesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGivenNoTableWhenAddTableTill3ToViewModelThen3Timestables() throws {
      let timesTables = TimesTables(numberOfTables: 3)
        
        XCTAssertEqual(timesTables.all.count, 3)
        // FIXME: Is egal and that's not normal
        XCTAssertEqual(timesTables.all[2], TableViewModel(of: 3, numberOfTables: 40))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
