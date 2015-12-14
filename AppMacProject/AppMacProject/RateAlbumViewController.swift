//
//  RateAlbumViewController.swift
//  AppMacProject
//
//  Created by 20064234 on 08/12/2015.
//  Copyright © 2015 WIT. All rights reserved.
//

import UIKit

class RateAlbumViewController: UIViewController {
    
    var albumToRate:Album!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.albumToRate.name;
        self.view.backgroundColor = UIColor.blackColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let button = sender as? UIButton{
            albumToRate.rating = button.tag
        }
    }
    
}

