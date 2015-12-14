//
//  AlbumDetailsViewController.swift
//  AppMacProject
//
//  Created by 20064234 on 07/12/2015.
//  Copyright © 2015 WIT. All rights reserved.
//

import UIKit

class AlbumDetailsViewController: UITableViewController {
    
    var album:Album!
    var artist:String = "AC/DC"
    
    var albumToEdit:Album?
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var deleteButtonCell: UITableViewCell!
    
    
    required init(coder aDecoder: NSCoder) {
        //println("init AlbumDetailsViewController")
        super.init(coder: aDecoder)!
    }
    
    deinit {
        //println("deinit AlbumDetailsViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        
        if(albumToEdit != nil){
            self.title = "Edit Album"
            nameTextField.text = albumToEdit!.name
            artist = albumToEdit!.artist
        }
        else{
            artist = "AC/DC"
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
        if segue.identifier == "SaveAlbumDetail" {
            if (self.albumToEdit != nil){
                self.albumToEdit?.name = self.nameTextField.text!
                self.albumToEdit?.artist = artist
            }
            else{
                album = Album(name: self.nameTextField.text!, artist: artist, rating: 3)
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