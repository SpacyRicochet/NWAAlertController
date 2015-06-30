//
//  NWAAlertControllerTests.swift
//  NWAAlertController
//
//  Created by Bruno Scheele on 30/06/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import NWAAlertController

class NWAAlertControllerSpec: QuickSpec
{
    override func spec()
    {
        var alertController: NWAAlertController?
        
        describe("AlertController is initialized") {
            context("with no title") {
                it("should have no title") {
                    alertController = NWAAlertController(title: nil, message: nil, preferredStyle: .Alert)
                    expect(alertController?.title).to(beNil())
                }
            }
            context("with a title") {
                it("should have a title") {
                    alertController = NWAAlertController(title: "Test", message: nil, preferredStyle: .Alert)
                    expect(alertController?.title) == "Test"
                }
            }
            context("with no message") {
                it("should have no message") {
                    alertController = NWAAlertController(title: nil, message: "Test", preferredStyle: .Alert)
                    expect(alertController?.message) == "Test"
                }
            }
            context("with a message") {
                it("should have a message") {
                    alertController = NWAAlertController(title: nil, message: nil, preferredStyle: .Alert)
                    expect(alertController?.message).to(beNil())
                }
            }
            context("with .Alert style") {
                it("should be an Alert") {
                    alertController = NWAAlertController(title: nil, message: nil, preferredStyle: .Alert)
                    expect(alertController?.preferredStyle) == UIAlertControllerStyle.Alert
                }
            }
            context("with .ActionSheet style") {
                it("should be an ActionSheet") {
                    alertController = NWAAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
                    expect(alertController?.preferredStyle) == UIAlertControllerStyle.ActionSheet
                }
            }
        }
        
        describe("AlertController has one action") {
            var action: UIAlertAction?
            
            beforeEach {
                alertController = NWAAlertController(title: nil, message: nil, preferredStyle: .Alert)
                action = UIAlertAction(title: "Action", style: .Default, handler: nil)
                alertController?.addAction(action!)
            }
            
            afterEach {
                alertController = nil
                action = nil
            }
            
            it("should have one action") {
                expect(alertController?.actions.count) == 1
            }
        }
    }
}