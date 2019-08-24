
import UIKit
import Alamofire

class BudgetViewController: ViewController {
    let someDict:[Int:Int] = [1:5, 2:10, 3:15, 4:20, 5:25]
    let zipcodeUrlBase = "https://redline-redline-zipcode.p.rapidapi.com/rest"
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "redline-redline-zipcode.p.rapidapi.com",
        "x-rapidapi-key": "8d98971e96msh68ae3e27a6ab025p1b789djsn94914361df73"
    ]
    
    @IBOutlet var distanceButtons: [UIStackView]!
    var elligibleZipcodes: [String] = []
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        distanceButtons.forEach { view in
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action:
                #selector(onDistanceButtonTouched)))
        }
        
        print(elligibleZipcodes)
    }
    
    @objc private func onDistanceButtonTouched(sender: UIGestureRecognizer) {
        print("the following button tag was pressed \(sender.view?.tag)")
        
        let radius = someDict[sender.view!.tag]
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.context.user.radius = radius
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let popVC = storyboard.instantiateViewController(withIdentifier: "Pop")
        self.navigationController?.pushViewController(popVC, animated: true)
        
//        getLocationInfo(zipcode: zipCode!, radius: radius!) { locationInfo in
//            guard let locationInfoValid = locationInfo else {
//                return
//            }
//
//
////                print("Valid")
////                    for location in locationInfoValid["zip_codes"]! as Array<>  {
////                    let address = Address()
////                    //address.city = location["city"] as? String
////                    //address.state = location["state"] as? String
////                    address.zip_code = location["zip_code"] as? String
////
////                    appDelegate.context.addresses?.append(address)
////                }
//
//
//        }
    }
}
