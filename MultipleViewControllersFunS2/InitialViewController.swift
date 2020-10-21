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

// MARK: - Navigation and Tab bar controllers
// we learned how to set up segues manually, which is great
// but for common workflows, iOS has controllers we can use
// example: the user clicks on an item in a list, then they go to a screen where they see details for the item
// 1. Navigation controller: great for drill-down interfaces (e.g. hierarchical relationship amongst screens)
// 2. Tab bar controller: great for flat interfaces (e.g. indepedent screens)


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
            if identifier == "automaticSegue" || identifier == "manualSegue" {
                // now, we want to downcast the general UIViewController for the destination view controller to SecondViewController
                if let secondVC = segue.destination as? SecondViewController {
                    // we want to set a property of secondVC to store the text from the username text field
                    secondVC.usernameOptional = usernameTextField.text
                }
            }
        }
        
    }

    @IBAction func manualSegueButtonPressed(_ sender: UIButton) {
        print("triggering manual segue")
        
        // call performSegue()
        performSegue(withIdentifier: "manualSegue", sender: self)
    }
    
    // one more segue method to show you
    // only called for automatic segues
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // we should check the credentials of the user before we segue to second view controller
        // check for now, that the user entered in a username
        // TODO: finish this
        guard let username = usernameTextField.text, username != "" else {
            return false // don't perform the segue, the user did not enter a username
        }
        
        return true 
    }
}

