//
//  ViewController.swift
//  MultipleViewControllersFunS2
//
//  Created by Gina Sprint on 10/15/20.
//  Copyright © 2020 Gina Sprint. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    @IBOutlet var usernameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func unwindToInitialVC(segue: UIStoryboardSegue) {
        print("unwinding to initial view controller")
    }

}

