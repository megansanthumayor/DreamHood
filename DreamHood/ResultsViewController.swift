
//
//  File.swift
//  DreamHood
//
//  Created by Megan Santhumayor on 8/21/19.
//  Copyright © 2019 GirlsWhoCode. All rights reserved.
//

import UIKit

class ResultsViewController: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var addresses: [Address]?
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Find your DreamHood below!"
    
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 110
        
        print(addresses)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addresses != nil ? addresses!.count : 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressCell", for: indexPath) as! AdressCellTableViewCell
        cell.label.text =  addresses![indexPath.row].city! + ", " + addresses![indexPath.row].state!
        cell.label2.text =  addresses![indexPath.row].zip_code
        return cell
    }
}
