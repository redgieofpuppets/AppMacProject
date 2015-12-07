//
//  CoffeeDetailsViewController.swift
//  AppMacProject
//
//  Created by 20064234 on 07/12/2015.
//  Copyright © 2015 WIT. All rights reserved.
//

import UIKit

class CoffeeDetailsViewController: UITableViewController {
    
    var coffee:Coffee!
    var shop:String = "Centra"
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        print("init CoffeeDetailsViewController")
        super.init(coder: aDecoder)!
    }
    
    deinit {
        print("deinit CoffeeDetailsViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = shop
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveCoffeeDetail" {
            coffee = Coffee(name: self.nameTextField.text!, shop: shop, rating: 3)
        }
        if segue.identifier == "PickShop" {
            let shopPickerViewController = segue.destinationViewController as! ShopPickerViewController
            shopPickerViewController.selectedShop = shop
        }
    }
    
    @IBAction func selectedShop(segue:UIStoryboardSegue) {
        let shopPickerViewController = segue.sourceViewController as! ShopPickerViewController
        if let selectedShop = shopPickerViewController.selectedShop {
            detailLabel.text = selectedShop
            shop = selectedShop
        }
    }
}
