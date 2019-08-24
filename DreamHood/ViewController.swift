
//  ViewController.swift
//  DreamHood
//  Created by joyce wang on 8/13/19.
//  Copyright © 2019 joyce wang. All rights reserved.

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let text = myTextField.text
//        myTextField.text = "DreamHood"
    }
    
    
    @IBAction func signInTapped(_ sender: Any) {
        print(sender)
        //print("Sign-In tapped")
        var user = userName.text;
        var pass = password.text;
     
    
        if((user?.isEqual("hood"))! && (pass?.isEqual("hello123"))!){
            print("success");
            //user = "";
           //pass = "";
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.context.user = User()
            performSegue(withIdentifier: "mySegue", sender: (Any).self);
        }
        else{
            print("sign in fail");
            
        }
    }
    
}
