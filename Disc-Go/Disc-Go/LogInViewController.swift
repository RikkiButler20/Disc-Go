//
//  LogInViewController.swift
//  Disc-Go
//
//  Created by Kayla Butler on 6/3/20.
//  Copyright © 2020 Kayla Butler. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    //creating fake user DB
    //[first name, last name, email, password, security question, security answer]
    var userDB = [
        "shanetoohotforyou" : ["Shane", "May", "shanetoohotforyou@gmail.com", "Password2013", "Favorite color", "Blue"],
        "KayRB1" : ["Kayla", "Butler", "kayla.butler8@icloud.com", "Pa55w0rd", "Fav show", "Supernatural"],
        "ImWraith" : ["Wraith", "Surname", "iamthevoid@hotmail.com", "VoidWalker1", "Favorite gun", "Wingman"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
