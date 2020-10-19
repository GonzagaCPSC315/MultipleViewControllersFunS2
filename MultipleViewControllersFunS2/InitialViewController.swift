//
//  ViewController.swift
//  MultipleViewControllersFunS2
//
//  Created by Gina Sprint on 10/15/20.
//  Copyright © 2020 Gina Sprint. All rights reserved.
//

import UIKit

// MARK: - Multiple View Controllers
// so far, all of our apps have had one screen
// recall: 1 scene in IB = 1 screen = managed by 1 view controller

// MARK: - Segues
// a segue is a transition from one view controller to another
// 2 types
// 1. automatic (let IB handle)
// 2. manual (we will trigger the segue in Swift)



class InitialViewController: UIViewController {
    @IBOutlet var usernameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func unwindToInitialVC(segue: UIStoryboardSegue) {
        print("unwinding to initial view controller")
    }
    
    // we want to grab the text from the username text field and send it into our SecondViewController
    // prepare(for:sender:) is called right before a segue occurs
    // override it!!
    // here that we will pass data into the second view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // sender: is the view that triggered the segue (if there is one)
        // segue has 3 important properties
        // source: this is the instigating view controller
        // destination: this is the new view controller
        // identifier: this is the string you may have set up in IB
        if let identifier = segue.identifier {
            if identifier == "automaticSegue" {
                // now, we want to downcast the general UIViewController for the destination view controller to SecondViewController
                if let secondVC = segue.destination as? SecondViewController {
                    // we want to set a property of secondVC to store the text from the username text field
                    secondVC.usernameOptional = usernameTextField.text
                }
            }
        }
        
    }

}

