//
//  CVItemTests.swift
//  CodeChallangeTests
//
//  Created by Salome Tsiramua on 10/13/19.
//  Copyright © 2019 Salome Tsiramua. All rights reserved.
//

import XCTest
@testable import CodeChallange

class CVItemTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCVItem() {
        
        let cvItem = CVItem(title: "Name", value: "Salome")
        
        XCTAssertEqual(cvItem.title, "Name")
        XCTAssertEqual(cvItem.value, "Salome")
        
        XCTAssertNotNil(cvItem.title)
        XCTAssertNotNil(cvItem.value)
        
    }
    
    // Value can not be nil (testing for random text) checking for not nil
    func testNonOptionalValues() {
        let cvItem = CVItem(title: "nil", value: "nil")
        
        XCTAssertNotNil(cvItem.title)
        XCTAssertNotNil(cvItem.value)
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
