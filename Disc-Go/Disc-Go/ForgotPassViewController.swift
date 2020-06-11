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
    @IBOutlet weak var resetPasswordBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func isInformationInputted(_ info1: UITextField, _ info2: UITextField) -> Bool {
        if info1.text!.isEmpty || info2.text!.isEmpty {
            return false
        }
        return true
        
    }
    
    @IBAction func userSecurityQuestion(_ sender: Any) { //TODO: Change when backend comes in
        
        if !isInformationInputted(email, username) {
            alertPopUp("Alert", alertMessage: "Please fill out all textfields")
            return
        }
        if userDB[username.text ?? ""] == nil {
            alertPopUp("Alert", alertMessage: "Username was not found")
            return
        }
        
        let userInfo = userDB[username.text!]
        
        //check if email and username combo exists
        if email.text!.lowercased() == userInfo?[2] {
            //put the user's security question in the textfield
            securityQuestion.text = userInfo?[4]
            //unhidden the security question, answer & button
            securityQuestion.isHidden = false
            securityAnswer.isHidden = false
            resetPasswordBtn.isHidden = false
        } else {
            alertPopUp("Alert", alertMessage: "Email does not match with username")
            return
        }
    }
    
    @IBAction func resetPassword(_ sender: Any) {
        if securityAnswer.text!.isEmpty {
            alertPopUp("Alert", alertMessage: "Please fill in the textfield")
            return
        }
        
         let userInfo = userDB[username.text!]
        
        if securityAnswer.text != userInfo?[5] {
            alertPopUp("Alert", alertMessage: "Incorrect security answer")
            return
        } else{
            //TODO: Make this better later
            alertPopUp("Password", alertMessage: userInfo?[3] ?? "ERROR!")
        }
    }
    
    func alertPopUp(_ alertTitle: String, alertMessage: String) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { (_) in
            print("You closed the alert")
        }))

        self.present(alert, animated: true, completion: nil)
    }
    
}
