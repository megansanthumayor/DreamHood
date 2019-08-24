//
//  SecondViewController.swift
//  DreamHood
//
//  Created by joyce wang on 8/13/19.
//  Copyright © 2019 GirlsWhoCode. All rights reserved.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBAction func didTapNext() {
        performSegue(withIdentifier: "stateToDistanceSegue", sender: nil)
    }
    
    // API location
    let zipcodeUrlBase = "https://redline-redline-zipcode.p.rapidapi.com/rest"
    
    // We need some headers for our API calls to work
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "redline-redline-zipcode.p.rapidapi.com",
        "x-rapidapi-key": "8d98971e96msh68ae3e27a6ab025p1b789djsn94914361df73"
    ]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
   }
    
    func getZipcodesNearWork(distance: String, zipcode: String, completionHandler: @escaping (_ locationInfo: [String: Any]?) -> ()) {
        
        let urlString = "\(zipcodeUrlBase)/radius.json/\(zipcode)/\(distance)/mile"

        // Another way of checking if something exists
        // It's a little less extreme than using the ! but a lot more lines of code
        // Use this to prevent your code from crashing due to variables not existing
//        guard let url = URL(string: urlString) else {
//            return
//        }
        
        let url = URL(string: urlString)!
        
        Alamofire.request(url, method: .get, headers: headers).responseJSON { data in
            debugPrint(data)
        }
    }

  // @IBOutlet weak var picker: UIPickerView!
    //var pickerData: [[String]] = [[String]]()
    
    @IBOutlet weak var pickerTextField: UITextField!
        var pickerData = ["Alabama"
            ,"Alaska"
            , "Arizona"
            , "Arkansas"
            , "California"
            , "Colorado"
            ,"Connecticut"
            , "Delaware"
            , "District Of Columbia"
            , "Florida"
            ,"Georgia"
            ,"Hawaii"
            , "Idaho"
            , "Illinois"
            , "Indiana"
            , "Iowa"
            , "Kansas"
            , "Kentucky"
            , "Louisiana"
            , "Maine"
            , "Maryland"
            ,"Massachusetts"
            ,"Michigan"
            ,"Minnesota"
            ,"Mississippi"
            , "Missouri"
            , "Montana"
            ,"Nebraska"
            ,"Nevada"
            , "New Hampshire"
            ,"New Jersey"
            , "New Mexico"
            ,"New York"
            ,"North Carolina"
            , "North Dakota"
            , "Ohio"
            , "Oklahoma"
            , "Oregon"
            , "Pennsylvania"
            , "Rhode Island"
            , "South Carolina"
            , "South Dakota"
            , "Tennessee"
            , "Texas"
            , "Utah"
            , "Vermont"
            , "Virginia"
            , "Washington"
            , "West Virginia"
            , "Wisconsin"
            , "Wyoming"
        ]
      
    override func viewDidLoad() {
        super.viewDidLoad()
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerTextField.inputView = pickerView
        
    }
    

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = pickerData[row]
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Make sure that we're trying to go to the Distance Screen
        if segue.identifier == "stateToDistanceSegue" {
            // Tell Swift that the destination is definitely a Distance View Controller
            let viewController = segue.destination as! DistanceViewController
            
            // The Distance View Controller has a cities field we can add data to
            
            // instead of NJ, swap this out for whatever is in the IBOutlet
//            getZipcodesFromState('NJ') { result in
//                viewController.cities = result
//            }
            //viewController.cities = ["08869"]
            
            // Now that we have data, perform the segue!
            
            
            
        }
        
        
    }
    



}

