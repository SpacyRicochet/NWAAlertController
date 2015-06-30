//
//  XCTestTests.swift
//  NWAAlertController
//
//  Created by Bruno Scheele on 29/06/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import XCTest
import NWAAlertController

class XCTestTests: XCTestCase {
    
    var alertController: NWAAlertController?
    
    override func setUp() {
        super.setUp()
        
        print("I'm run before each individual test. No nested beforeEaches for me :D")
        alertController = NWAAlertController(title: "Test 1", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
    }
    
    func testAlertControllerShouldMatchSetupTitle() {
        XCTAssertNotNil(alertController?.title)
        if let title = alertController?.title {
            XCTAssertEqual(title, "Test 1")
            XCTAssertNotEqual(title, "Test 2")
        }
    }
    
    func testAlertControllerWhenChangedShouldMatchNewTitle() {
        alertController?.title = "Test 2"
        XCTAssertNotNil(alertController?.title)
        if let title = alertController?.title {
            XCTAssertNotEqual(title, "Test 1")
            XCTAssertEqual(title, "Test 2")
        }
    }
    
    func testAsynchronousCall() {
        let expectation = self.expectationWithDescription("expectation")
        
        var time = "passing"
        
        dispatch_async(dispatch_get_main_queue()) {
            time = "done"
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(0.1) { (error) -> Void in
            XCTAssertEqual(time, "done")
        }
    }
}
