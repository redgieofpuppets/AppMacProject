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
    var artist:String = "Centra"
    
    var coffeeToEdit:Coffee?
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var deleteButtonCell: UITableViewCell!
    
    
    required init(coder aDecoder: NSCoder) {
        //println("init CoffeeDetailsViewController")
        super.init(coder: aDecoder)!
    }
    
    deinit {
        //println("deinit CoffeeDetailsViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(coffeeToEdit != nil){
            self.title = "Edit Coffee"
            nameTextField.text = coffeeToEdit!.name
            artist = coffeeToEdit!.artist
        }
        else{
            artist = "Centra"
            deleteButtonCell.hidden = true
        }
        detailLabel.text = artist
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
            if (self.coffeeToEdit != nil){
                self.coffeeToEdit?.name = self.nameTextField.text!
                self.coffeeToEdit?.artist = artist
            }
            else{
                coffee = Coffee(name: self.nameTextField.text!, artist: artist, rating: 3)
            }
        }
        if segue.identifier == "PickArtist" {
            let artistPickerViewController = segue.destinationViewController as! ArtistPickerViewController
            artistPickerViewController.selectedArtist = artist
        }
    }
    
    @IBAction func selectedArtist(segue:UIStoryboardSegue) {
        let artistPickerViewController = segue.sourceViewController as! ArtistPickerViewController
        if let selectedArtist = artistPickerViewController.selectedArtist {
            detailLabel.text = selectedArtist
            artist = selectedArtist
        }
    }
}