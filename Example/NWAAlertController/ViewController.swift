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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
