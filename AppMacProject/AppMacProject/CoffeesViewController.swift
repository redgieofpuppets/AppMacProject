//
//  CoffeesViewController.swift
//  AppMacProject
//
//  Created by 20064234 on 30/11/2015.
//  Copyright © 2015 WIT. All rights reserved.
//

import UIKit

class CoffeesViewController: UITableViewController {
    
    var coffees: [Coffee] = coffeesData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageForRating(rating:Int) -> UIImage? {
        switch rating {
        case 1:
            return UIImage(named: "1StarSmall")
        case 2:
            return UIImage(named: "2StarsSmall")
        case 3:
            return UIImage(named: "3StarsSmall")
        case 4:
            return UIImage(named: "4StarsSmall")
        case 5:
            return UIImage(named: "5StarsSmall")
        default:
            return nil
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffees.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            /*
            // Take 1
            let cell = tableView.dequeueReusableCellWithIdentifier("CoffeeCell", forIndexPath: indexPath)
            as UITableViewCell
            
            let coffee = coffees[indexPath.row] as Coffee
            cell.textLabel?.text = coffee.name
            cell.detailTextLabel?.text = coffee.shop
            return cell
            */
            
            /*
            // Take 2
            let cell = tableView.dequeueReusableCellWithIdentifier("CoffeeCell", forIndexPath: indexPath) as UITableViewCell //1
            
            let coffee = coffees[indexPath.row] as Coffee //2
            
            if let nameLabel = cell.viewWithTag(100) as? UILabel { //3
            nameLabel.text = coffee.name
            }
            if let shopLabel = cell.viewWithTag(101) as? UILabel {
            shopLabel.text = coffee.shop
            }
            if let ratingImageView = cell.viewWithTag(102) as? UIImageView {
            ratingImageView.image = self.imageForRating(coffee.rating)
            }
            return cell
            */
            
            // Take 3
            let cell = tableView.dequeueReusableCellWithIdentifier("CoffeeCell", forIndexPath: indexPath)
                as! CoffeeCell
            
            let coffee = coffees[indexPath.row] as Coffee
            cell.nameLabel.text = coffee.name
            cell.shopLabel.text = coffee.shop
            cell.ratingImageView.image = imageForRating(coffee.rating)
            return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            coffees.removeAtIndex(indexPath.row)
            // Delete the row from the tableview
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        }
    }
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "EditCoffee" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let coffeeDetailsViewController = navigationController.viewControllers[0] as! CoffeeDetailsViewController
            
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            let selectedCoffeeIndex = indexPath?.row
            
            if let index = selectedCoffeeIndex {
                let coffee = coffees[index]
                coffeeDetailsViewController.coffeeToEdit = coffee
            }
        }
        else if segue.identifier == "RateCoffee" {
            let rateCoffeeViewController = segue.destinationViewController as! RateCoffeeViewController
            
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            let selectedCoffeeIndex = indexPath?.row
            
            if let index = selectedCoffeeIndex {
                let coffee = coffees[index]
                rateCoffeeViewController.coffeeToRate = coffee
            }
        }
    }
    
    @IBAction func cancelToCoffeesViewController(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func saveCoffeeDetail(segue:UIStoryboardSegue) {
        let coffeeDetailsViewController = segue.sourceViewController as! CoffeeDetailsViewController
        
        if let coffeeToEdit = coffeeDetailsViewController.coffeeToEdit {
            // get index of coffeeToEdit in coffees array
            let coffeeToEditIndex = coffees.indexOf(coffeeToEdit)
            
            // get indexPath of coffeeToEdit in tableView
            let indexPath = NSIndexPath(forRow: coffeeToEditIndex!, inSection: 0)
            
            // reload that individual row
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        else {
            //add the new coffee to the coffees array
            coffees.append(coffeeDetailsViewController.coffee)
            
            //update the tableView
            let indexPath = NSIndexPath(forRow: coffees.count-1, inSection: 0)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        
        //hide the detail view controller
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveCoffeeRating(segue:UIStoryboardSegue) {
        let rateCoffeeViewController = segue.sourceViewController as! RateCoffeeViewController
        
        if let coffeeToRate = rateCoffeeViewController.coffeeToRate {
            // get index of coffeeToRate in coffees array
            let coffeeToRateIndex = coffees.indexOf(coffeeToRate)
            
            // get indexPath of coffeeToRate in tableView
            let indexPath = NSIndexPath(forRow: coffeeToRateIndex!, inSection: 0)
            
            // reload that individual row
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        
        //hide the rateCoffeeView controller
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func deleteCoffee(segue:UIStoryboardSegue) {
        let coffeeDetailsViewController = segue.sourceViewController as! CoffeeDetailsViewController
        
        if let coffeeToEdit = coffeeDetailsViewController.coffeeToEdit {
            // get index of coffeeToEdit in coffees array
            let coffeeToEditIndex = coffees.indexOf(coffeeToEdit)
            
            // get indexPath of coffeeToEdit in tableView
            let indexPath = NSIndexPath(forRow: coffeeToEditIndex!, inSection: 0)
            
            // delete coffee from array
            coffees.removeAtIndex(coffeeToEditIndex!)
            
            // delete that individual row
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:UITableViewRowAnimation.Fade)
        }
        
        //hide the detail view controller
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
