//
//  PopViewController.swift
//  DreamHood
//
//  Created by joyce wang on 8/16/19.
//  Copyright © 2019 GirlsWhoCode. All rights reserved.
//

import UIKit
//import requests
//import base64
import Alamofire

class EducationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Education() {
    
    // API location (this part won't change with different API calls)
        let urlString = "https://api.datademograph.com/v1/education/zip"
        
        let api_key = "k_ecf9164996bf8e11d9190b03bb309f3e"
        let data = api_key.data(using: .utf8)
        
        // We need some headers for our API calls to work
        let headers: HTTPHeaders = [
            "Authorization": "Digest \(data!.base64EncodedString())",
        ]
        let url = URL(string: urlString)!
        let params = [
            "zip": "08869"
        ]
        
        Alamofire.request(url, method: .get, parameters: params, headers: headers).response { dataResponse in
            let jsonDecoder = JSONDecoder()
            if let unwrappedData = dataResponse.data {
                do {
                    print("success")
                } catch {
                    print(error)
                }
            } else {
                print("didn't get any data from API call")
            }
        }
    }
}

