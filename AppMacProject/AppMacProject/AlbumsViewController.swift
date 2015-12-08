//
//  AlbumsViewController.swift
//  AppMacProject
//
//  Created by 20064234 on 30/11/2015.
//  Copyright © 2015 WIT. All rights reserved.
//

import UIKit

class AlbumsViewController: UITableViewController {
    
    var albums: [Album] = albumsData
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
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
        return albums.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            
            // Take 3
            let cell = tableView.dequeueReusableCellWithIdentifier("AlbumCell", forIndexPath: indexPath)
                as! AlbumCell
            
            let album = albums[indexPath.row] as Album
            cell.nameLabel.text = album.name
            cell.artistLabel.text = album.artist
            cell.ratingImageView.image = imageForRating(album.rating)
            return cell
    }
    
   
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            albums.removeAtIndex(indexPath.row)
            // Delete the row from the tableview
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        }
    }
  
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "EditAlbum" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let albumDetailsViewController = navigationController.viewControllers[0] as! AlbumDetailsViewController
            
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            let selectedAlbumIndex = indexPath?.row
            
            if let index = selectedAlbumIndex {
                let album = albums[index]
                albumDetailsViewController.albumToEdit = album
            }
        }
        else if segue.identifier == "RateAlbum" {
            let rateAlbumViewController = segue.destinationViewController as! RateAlbumViewController
            
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            let selectedAlbumIndex = indexPath?.row
            
            if let index = selectedAlbumIndex {
                let album = albums[index]
                rateAlbumViewController.albumToRate = album
            }
        }
    }
    
    @IBAction func cancelToAlbumsViewController(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func saveAlbumDetail(segue:UIStoryboardSegue) {
        let albumDetailsViewController = segue.sourceViewController as! AlbumDetailsViewController
        
        if let albumToEdit = albumDetailsViewController.albumToEdit {
            // get index of albumToEdit in albums array
            let albumToEditIndex = albums.indexOf(albumToEdit)
            
            // get indexPath of albumToEdit in tableView
            let indexPath = NSIndexPath(forRow: albumToEditIndex!, inSection: 0)
            
            // reload that individual row
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        else {
            //add the new album to the albums array
            albums.append(albumDetailsViewController.album)
            
            //update the tableView
            let indexPath = NSIndexPath(forRow: albums.count-1, inSection: 0)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        
        //hide the detail view controller
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveAlbumRating(segue:UIStoryboardSegue) {
        let rateAlbumViewController = segue.sourceViewController as! RateAlbumViewController
        
        if let albumToRate = rateAlbumViewController.albumToRate {
            // get index of albumToRate in albums array
            let albumToRateIndex = albums.indexOf(albumToRate)
            
            // get indexPath of albumToRate in tableView
            let indexPath = NSIndexPath(forRow: albumToRateIndex!, inSection: 0)
            
            // reload that individual row
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        
        //hide the rateAlbumView controller
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func deleteAlbum(segue:UIStoryboardSegue) {
        let albumDetailsViewController = segue.sourceViewController as! AlbumDetailsViewController
        
        if let albumToEdit = albumDetailsViewController.albumToEdit {
            // get index of albumToEdit in albums array
            let albumToEditIndex = albums.indexOf(albumToEdit)
            
            // get indexPath of albumToEdit in tableView
            let indexPath = NSIndexPath(forRow: albumToEditIndex!, inSection: 0)
            
            // delete album from array
            albums.removeAtIndex(albumToEditIndex!)
            
            // delete that individual row
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:UITableViewRowAnimation.Fade)
        }
        
        //hide the detail view controller
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
