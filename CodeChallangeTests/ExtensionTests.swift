//
//  ExtensionTests.swift
//  CodeChallangeTests
//
//  Created by Salome Tsiramua on 10/13/19.
//  Copyright © 2019 Salome Tsiramua. All rights reserved.
//

import XCTest
@testable import CodeChallange

class ExtensionTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUIViewControllerIdentifier() {
        XCTAssertEqual(CVViewController.identifier, "CVViewController")
    }
    
    func textUIViewIdentifier() {
        XCTAssertEqual(CVItemTableViewCell.identifier, "CVItemTableViewCell")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
