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
            incorrectInformationAlert("Alert", alertMessage: "Please fill out all textfields")
            return
        }
        if userDB[username.text ?? ""] == nil {
            incorrectInformationAlert("Alert", alertMessage: "Username was not found")
            return
        }
        
        let userInfo = userDB[username.text!]
        
        //check if email and username combo exists
        if userInfo?[2] == email.text! {
            //put the user's security question in the textfield
            securityQuestion.text = userInfo?[4]
            //unhidden the security question, answer & button
            securityQuestion.isHidden = false
            securityAnswer.isHidden = false
            resetPasswordBtn.isHidden = false
        } else {
            incorrectInformationAlert("Alert", alertMessage: "Email does not match username")

        }
        

        
    }
    @IBAction func resetPassword(_ sender: Any) {
    }
    
    func incorrectInformationAlert(_ alertTitle: String, alertMessage: String) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { (_) in
            print("You closed the alert")
        }))

        self.present(alert, animated: true, completion: nil)
    }
    
}
