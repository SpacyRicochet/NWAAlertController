//
//  ViewController.swift
//  NWAAlertController
//
//  Created by Bruno Scheele on 06/27/2015.
//  Copyright (c) 06/27/2015 Bruno Scheele. All rights reserved.
//

import UIKit
import NWAAlertController

class ViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("UIStackView layoutMargins: \(stackView.layoutMargins) and layoutMarginsRelativeArrangement: \(stackView.layoutMarginsRelativeArrangement)")
//        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        stackView.layoutMarginsRelativeArrangement = true
//        print("UIStackView layoutMargins: \(stackView.layoutMargins) and layoutMarginsRelativeArrangement: \(stackView.layoutMarginsRelativeArrangement)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - User Interaction
    
    @IBAction func showUIAlertControllerTapped(sender: AnyObject)
    {
        let alertController = UIAlertController(title: "Test", message: "This is what we want to create as a first alert view.", preferredStyle: .Alert)
        
        alertController.addAction(UIAlertAction(title: "Dismiss this view", style: .Default, handler: nil))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    @IBAction func showNWAAlertControllerTapped(sender: AnyObject)
    {
        let alertController = NWAAlertController(title: "Test", message: "This is what we want to create as a first alert view.", preferredStyle: .Alert)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}
