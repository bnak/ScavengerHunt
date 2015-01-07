//
//  ListViewController.swift
//  ScavengerHunt
//
//  Created by Beth Nakamura on 9/5/14.
//  Copyright (c) 2014 Beth Nakamura. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var itemsList = [ScavengerHuntItem]()
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: NSDictionary) {
        let indexPath = tableView.indexPathForSelectedRow()!
        let selectedItem = itemsList[indexPath.row]
        
        let photo = info[UIImagePickerControllerOriginalImage] as UIImage
        selectedItem.photo = photo
        
        dismissViewControllerAnimated(true, completion: {
            self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
            self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        })
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            imagePicker.sourceType = .Camera
        } else {
            imagePicker.sourceType = .PhotoLibrary
        }
        
        imagePicker.delegate = self
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        
        if segue.identifier == "DoneItem" {
            let addItemController = segue.sourceViewController as ViewController
            
            if let newItem = addItemController.createdItem{
                itemsList += [newItem]
                
                let indexPath = NSIndexPath(forRow: itemsList.count - 1, inSection: 0)
                
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
    
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section:Int) ->Int {
        return itemsList.count
    }
    
    
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell") as
                UITableViewCell
            
            let item = itemsList[indexPath.row]
            cell.textLabel!.text = item.name
            
            if (item.isComplete){
                cell.accessoryType = .Checkmark
                cell.imageView!.image = item.photo
            } else {
                cell.accessoryType = .None
                cell.imageView?.image = nil
            }
            
            return cell
    
    }
}