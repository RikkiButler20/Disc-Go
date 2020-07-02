//
//  SignUpViewController.swift
//  Disc-Go
//
//  Created by Kayla Butler on 6/3/20.
//  Copyright © 2020 Kayla Butler. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var securityQuestion: UITextField!
    @IBOutlet weak var securityAnswer: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func isInformationThere() -> Bool { //TODO: extra turn the missing textfield red
        if firstName.text!.isEmpty {
            return false
        } else if lastName.text!.isEmpty {
            return false
        } else if email.text!.isEmpty {
            return false
        } else if username.text!.isEmpty {
            return false
        } else if password.text!.isEmpty {
            return false
        } else if confirmPassword.text!.isEmpty {
            return false
        } else if securityQuestion.text!.isEmpty {
            return false
        } else if securityAnswer.text!.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword(_ pass: String) -> Bool {
        let passwordRegEx = "[A-Z0-9a-z]+[._%+-]*"

        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: pass) && pass.count >= 8
    }
    
    @IBAction func signUpUser(_ sender: Any) { //TODO: Change when backend works
        //all information must be filled out
        if !isInformationThere() {
            incorrectInformationAlert(alertMessage: "Information is missing")
            return
        }
        
        //email follows email format
        if !isValidEmail(email.text!) {
            incorrectInformationAlert(alertMessage: "Input a valid email")
            return
        }
        
        //password follows criteria
        if !isValidPassword(password.text!) {
            incorrectInformationAlert(alertMessage: "Password doesn't follow criteria\nLength of 8")
        }
        
        //passwords must match
        if password.text != confirmPassword.text {
            incorrectInformationAlert(alertMessage: "Passwords do not match")
            return
        }
        
        //TODO: get information from backend
        
        //if username exists
        if userDB[username.text!] != nil {
            incorrectInformationAlert(alertMessage: "Username already exists")
            return
        }
        
        //TODO: send info to backend
        userDB[username.text!] = [firstName.text!, lastName.text!, email.text!, password.text!, securityQuestion.text!, securityAnswer.text!]
        curUser = userDB[username.text!]!
        
        //segue
        performSegue(withIdentifier: "signup", sender: nil)
    }
    
    func incorrectInformationAlert(alertMessage: String) {
        let alert = UIAlertController(title: "Alert", message: alertMessage, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { (_) in
            print("You closed the alert")
        }))

        self.present(alert, animated: true, completion: nil)
    }
}
