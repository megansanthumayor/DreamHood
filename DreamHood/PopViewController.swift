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

class PopViewController: UIViewController {
    @IBOutlet weak var ruralImage: UIImageView!
    @IBOutlet weak var subimage: UIImageView!
    @IBOutlet weak var urbanImage: UIImageView!
    
    let zipcodeUrlBase = "https://redline-redline-zipcode.p.rapidapi.com/rest"
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "redline-redline-zipcode.p.rapidapi.com",
        "x-rapidapi-key": "8d98971e96msh68ae3e27a6ab025p1b789djsn94914361df73"
    ]
    
    let sizes = [0: 1000000, 1: 15000000, 2: 1000000000]
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: AppContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        context = appDelegate.context
        
        setupViews()
    }
    
    func setupViews() {
        ruralImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action:
            #selector(onButtonTouched(sender:))))
        subimage.addGestureRecognizer(UITapGestureRecognizer(target: self, action:
            #selector(onButtonTouched(sender:))))
        urbanImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action:
            #selector(onButtonTouched(sender:))))
    }

    
    @objc func onButtonTouched(sender: UIGestureRecognizer) {
        context.user.population = sender.view?.tag
        
        getZipCodes { addresses in
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let resultVC = storyboard.instantiateViewController(withIdentifier: "Result") as! ResultsViewController
            resultVC.addresses = addresses!.filter {($0.population! >= self.sizes[sender.view!.tag]!)}
            
            self.navigationController?.pushViewController(resultVC, animated: true)
        }
    }
    
    func getZipCodes(completion: @escaping (_ addresses: [Address]?) -> ()) {
        getCloseZipcodes(zipcode: context.user!.zipcode!, radius: context.user.radius!) { locationInfo in
            guard let zipcodes = locationInfo!["zip_codes"] as? [[String: Any]] else {
                return
            }
            
            var times = 0
            
            var addresses = [Address]()
            
            for zip in zipcodes {
                let tempAddress = Address()
                tempAddress.city = zip["city"] as! String
                tempAddress.state = zip["state"] as! String
                tempAddress.zip_code = zip["zip_code"] as! String
                
                self.getPopulation(zip["zip_code"] as! String) { popInfo in
                    guard let population = popInfo else {
                        return
                    }
                    
                    tempAddress.population = population
                    addresses.append(tempAddress)
                    print(population)
                    times += 1
                    if times == zipcodes.count {
                        completion(addresses)
                    }
                }
            }
        }
        
        
    }
    
    
    func getPopulation(_ zipcode: String, completion: @escaping (_ populationInfo: Int?) -> ()) {
        // API location (this part won't change with different API calls)
        let urlString = "https://api.datademograph.com/v1/population/zip"
        
        let api_key = "k_ef3fee9bd46085621b41ff76a4b69512"
        let data = api_key.data(using: .utf8)
        
        // We need some headers for our API calls to work
        let headers: HTTPHeaders = [
            "Authorization": "Digest \(data!.base64EncodedString())",
        ]
        let url = URL(string: urlString)!
        let params = [
            "zip": appDelegate.context.user.zipcode!
        ]
        
        Alamofire.request(url, method: .get, parameters: params, headers: headers).responseJSON { dataResponse in
            if let unwrappedData = dataResponse.result.value as? [String: Any] {
                
                let popDictionary = unwrappedData["population_estimates"] as! [String: Int]
                
                completion(popDictionary[popDictionary.keys.first!])
            } else {
                print("didn't get any data from API call")
                completion(nil)
            }
        }

    }
    
    func getCloseZipcodes(zipcode: String, radius: Int, completionHandler: @escaping (_ locationInfo: [String: Any]?) -> ()) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // Remove this line for production
//        completionHandler(appDelegate.context.mockLocationNetworkResult)
        
        let urlString = "\(zipcodeUrlBase)/radius.json/\(zipcode)/\(radius)/mile"
        let url = URL(string: urlString)!
        
        Alamofire.request(url, method: .get, headers: headers).responseJSON { response in
            
            debugPrint(response)
            
            if let json = response.result.value as? [String: Any] {
                completionHandler(json)
            } else {
                completionHandler(nil)
            }
        }
    }
}


