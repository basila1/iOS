//
//  CancelButtonDelegate.swift
//  BucketList
//
//  Created by Basila Nathan on 3/9/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import Foundation

protocol CancelButtonDelegate: class {
    func cancelButtonPressed(by controller: AddItemTableViewController)
    func saveButtonPressed(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?)
    
    
}
