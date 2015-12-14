//
//  Album.swift
//  AppMacProject
//
//  Created by 20064234 on 30/11/2015.
//  Copyright © 2015 WIT. All rights reserved.
//

import Foundation
import UIKit

class Album: NSObject {
    var name: String
    var artist: String
    var rating: Int
    
    init(name: String, artist: String, rating: Int) {
        self.name = name
        self.artist = artist
        self.rating = rating
        super.init()
    }
}