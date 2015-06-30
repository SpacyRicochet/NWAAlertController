//
//  QuickTests.swift
//  NWAAlertController
//
//  Created by Bruno Scheele on 29/06/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
// https://github.com/Quick/Quick

import Quick
import Nimble
import NWAAlertController

class QuickTestSpec: QuickSpec
{
    override func spec()
    {
        var alertController: NWAAlertController?
        
        describe("AlertController") {
            beforeEach {
                print("I'm run before each of tests in this group.")
                alertController = NWAAlertController(title: "Test 1", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
            }
            
            it("should be 'Test 1'") {
                expect(alertController!.title) == "Test 1"
                expect(alertController!.title) != "Test 2"
            }
            
            context("the title has changed to 'Test 2'") {
                beforeEach {
                    print("I'm run before each of these context tests.")
                    alertController!.title = "Test 2"
                }
                
                it("should be 'Test 2'") {
                    expect(alertController!.title) != "Test 1"
                    expect(alertController!.title) == "Test 2"
                }
            }
        }
        
        describe("Asynchronous test") {
            it("will eventually pass") {
                var time = "passing"
                
                dispatch_async(dispatch_get_main_queue()) {
                    time = "done"
                }
                
                expect(time).toEventually(equal("done"))
            }
        }
    }
}
