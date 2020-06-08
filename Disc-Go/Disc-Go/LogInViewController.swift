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
    
    var curUser = [String]()
    
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
    @IBAction func logIn(_ sender: Any) { //TODO: Fix when backend comes in
        //if both fields aren't filled out
        let usernameText = username.text ?? ""
        let passwordText = password.text ?? ""
        
        if usernameText.isEmpty || passwordText.isEmpty {
            return
        }
        
        //if username exists
        if userDB[usernameText] != nil {
            //check if password matches that password
            
            guard let user = userDB[usernameText] else {
                print("couldn't get name from dictionary")
                return
            }
            
            if passwordText == user[3] { //getting the password from the array
                //curUser = the array of the user we got from DB & include the username
                var curUser = user
                curUser.append(usernameText)
                print("Logging In")
                
                //segue to account page TODO: Do the segue
            } else {
                //pop up of password doesn't match
                incorrectPasswordAlert(alertMessage: "Password is incorrect")
            }
        } else {
            incorrectPasswordAlert(alertMessage: "Username is incorrect")
        }
            
            
        //pop up of username doesn't exist
    }
    
    func incorrectPasswordAlert(alertMessage: String) {
        let alert = UIAlertController(title: "Alert", message: alertMessage, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { (_) in
            print("You closed the incorrect password alert")
        }))

        self.present(alert, animated: true, completion: nil)
    }
    
}
