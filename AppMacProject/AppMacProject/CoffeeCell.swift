//
//  CoffeeCell.swift
//  AppMacProject
//
//  Created by 20064234 on 30/11/2015.
//  Copyright © 2015 WIT. All rights reserved.
//

import UIKit

class CoffeeCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
