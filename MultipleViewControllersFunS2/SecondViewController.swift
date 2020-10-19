//
//  SecondViewController.swift
//  MultipleViewControllersFunS2
//
//  Created by Gina Sprint on 10/15/20.
//  Copyright © 2020 Gina Sprint. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var welcomeLabel: UILabel!
    
    var usernameOptional: String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        welcomeLabel.text = "Welcome, Anonymous"
        if let username = usernameOptional, username != "" {
            welcomeLabel.text = "Welcome, \(username)"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
