//
//  Coffee.swift
//  AppMacProject
//
//  Created by 20064234 on 30/11/2015.
//  Copyright © 2015 WIT. All rights reserved.
//

import Foundation
import UIKit

class Coffee: NSObject {
    var name: String
    var shop: String
    var rating: Int
    
    init(name: String, shop: String, rating: Int) {
        self.name = name
        self.shop = shop
        self.rating = rating
        super.init()
    }
}