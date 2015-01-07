//
//  ViewController.swift
//  ScavengerHunt
//
//  Created by Beth Nakamura on 9/5/14.
//  Copyright (c) 2014 Beth Nakamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var TextField: UITextField!
    
    var createdItem: ScavengerHuntItem?
    
    override func prepareForSegue(segue:UIStoryboardSegue, sender: AnyObject?){
        
        if segue.identifier == "DoneItem" {
            if let name = TextField.text {
                if !name.isEmpty {
                    createdItem = ScavengerHuntItem(name:name)
                }
            }
        }
    }
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }


}

