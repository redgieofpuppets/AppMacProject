//  ArtistPickerViewController.swift
//  AppMacProject
//
//  Created by 20064234 on 07/12/2015.
//  Copyright © 2015 WIT. All rights reserved.
//
import UIKit

class ArtistPickerViewController: UITableViewController {
    var selectedArtist:String? = nil
    var selectedArtistIndex:Int? = nil
    
    var artists:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artists = ["AC/DC",
            "Alice in Chains",
            "Anthrax",
            "Bon Jovi",
            "Guns n Roses",
            "Metallica",
            "Thin Lizzy"]
        
        if let artist = selectedArtist {
            selectedArtistIndex = artists.indexOf(artist)!
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ArtistCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = artists[indexPath.row]
        
        if indexPath.row == selectedArtistIndex {
            cell.accessoryType = .Checkmark
        }
        else {
            cell.accessoryType = .None
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //Other row is selected - need to deselect it
        if let index = selectedArtistIndex {
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
            cell?.accessoryType = .None
        }
        
        selectedArtistIndex = indexPath.row
        selectedArtist = artists[indexPath.row]
        
        //update the checkmark for the current row
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveSelectedArtist" {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            selectedArtistIndex = indexPath?.row
            if let index = selectedArtistIndex {
                selectedArtist = artists[index]
            }
        }
    }
}
