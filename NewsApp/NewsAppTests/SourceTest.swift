//
//  SourceTest.swift
//  NewsAppTests
//
//  Created by Geovanni Oliveira de Jesus on 01/10/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import XCTest
@testable import NewsApp
class SourceTest: XCTestCase {

    var source: Source?
    
    override func setUp() {
        source = Source(id: "001", name: "BBC")
    }

    func testSourceNotNil() {
        XCTAssertNotNil(source)
    }

    func testSourceID() {
        XCTAssertEqual(source?.getSourceID(), "001")
    }
    
    func testSourceName() {
        XCTAssertEqual(source?.getSourceName(), "BBC")
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
