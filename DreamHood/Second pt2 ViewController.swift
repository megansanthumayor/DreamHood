//
//  Second pt2 ViewController.swift
//  DreamHood
//
//  Created by joyce wang on 8/14/19.
//  Copyright © 2019 GirlsWhoCode. All rights reserved.
//

import UIKit

class Second_pt2_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    /*
    @IBOutlet weak var userEmailField: UITextField!
    @IBOutlet weak var userPasswordField: UITextField!
    @IBOutlet weak var userRepeatPasswordField: UITextField!
    
    //When Create Account Button on Register Page is pressed
    @IBAction func registerButton(sender: AnyObject){
        let userEmail = userEmailField.text
        let userPassword = userPasswordField.text
        let userRepeatPassword = userRepeatPasswordField.text
        
        //Check if fields are empty
        if (userEmail.isEmpty || userPassword.isEmpty ||
            userRepeatPassword.isEmpty){
            displayAlert("All information is required")
            return
        }
        //Check if Password is same as RepeatPassword
        if (userPassword.text!=userRepeatPassword){
            displayAlert("Passwords do not match")
            return
        }
    }
    //Display alert
    func displayAlert(userMessage:String){
        let alertController = UIAlertController(title: "Alert title", message: "Message to display",
                                                preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) {
            (action:UIAlertAction!) in
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
            
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:nil)
    }
 */

}
