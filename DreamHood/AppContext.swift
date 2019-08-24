//
//  AppContext.swift
//  DreamHood
//
//  Created by joyce wang on 8/20/19.
//  Copyright © 2019 GirlsWhoCode. All rights reserved.
//

import Foundation

public class AppContext {
    public var tempAddress: Address?
    
    
    let mockLocationNetworkResult = ["zip_codes": [
        ["city": "Windsor",
        "distance": "9.616",
        "state": "NJ",
        "zip_code": "08561"
        ],
        ["city": "Spotswood",
        "distance": "8.467",
        "state": "NJ",
        "zip_code": "08884"
        ]]]
    
    public var addresses: [Address]?
    
    public var user: User!
    
    //let location: [String : Any]
    //let locationArray: [[String : Any]]
//    {
//    city = Spotswood;
//    distance = "8.467000000000001";
//    state = NJ;
//    "zip_code" = 08884;
//    },
//    {
//    city = Blawenburg;
//    distance = "7.941";
//    state = NJ;
//    "zip_code" = 08504;
//    },
//    {
//    city = "Rocky Hill";
//    distance = "4.748";
//    state = NJ;
//    "zip_code" = 08553;
//    },
//    {
//    city = "Belle Mead";
//    distance = "6.827";
//    state = NJ;
//    "zip_code" = 08502;
//    },
//    {
//    city = "New Brunswick";
//    distance = "8.670999999999999";
//    state = NJ;
//    "zip_code" = 08901;
//    },
//    {
//    city = Somerset;
//    distance = "7.934";
//    state = NJ;
//    "zip_code" = 08875;
//    },
//    {
//    city = Somerset;
//    distance = "7.544";
//    state = NJ;
//    "zip_code" = 08873;
//    },
//    {
//    city = Hillsborough;
//    distance = "9.878";
//    state = NJ;
//    "zip_code" = 08844;
//    }
//    ]
}
