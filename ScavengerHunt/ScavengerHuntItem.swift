//
//  ScavengerHuntItem.swift
//  ScavengerHunt
//
//  Created by Beth Nakamura on 9/5/14.
//  Copyright (c) 2014 Beth Nakamura. All rights reserved.
//

import Foundation
import UIKit

class ScavengerHuntItem: NSObject {

    let name: String
    var photo: UIImage?
    var isComplete: Bool {
        get {
            return photo != nil
        }
    }
    
    init(name:String) {
        self.name = name
    }

}
