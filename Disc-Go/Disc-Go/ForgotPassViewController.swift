//
//  ForgotPassViewController.swift
//  Disc-Go
//
//  Created by Kayla Butler on 6/3/20.
//  Copyright © 2020 Kayla Butler. All rights reserved.
//

import UIKit

class ForgotPassViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var securityQuestion: UITextField!
    @IBOutlet weak var securityAnswer: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func userSecurityQuestion(_ sender: Any) {
    }
    @IBAction func resetPassword(_ sender: Any) {
    }
    
}
