//
//  BudgetViewController.swift
//  DreamHood
//
//  Created by joyce wang on 8/15/19.
//  Copyright © 2019 GirlsWhoCode. All rights reserved.
//
import UIKit

class DistanceViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.context.user = User()
    }
    
    
    @IBOutlet weak var zipcodeText: UITextField!
    
    @IBAction func didTapSendButton() {
        if zipcodeText == nil || zipcodeText.text!.isEmpty {
            return
        }
        
        if let zipcode = zipcodeText.text, zipcode.count == 5 {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.context.user.zipcode = zipcode
        }
    }
}
