//
//  ZipCodeModel.swift
//  DreamHood
//
//  Created by Megan Santhumayor on 8/19/19.
//  Copyright © 2019 GirlsWhoCode. All rights reserved.
//

import Foundation

public class Address {
    var zip_code: String?
    var city: String?
    var population: Int?
    var state: String?
}

public class User {
    var zipcode: String?
    var radius: Int?
    var population: Int? //Small population = 0, middle= 1, large= 2
    var income: Int? //Small = 0, middle = 1, large = 2, extra large = 3
}
