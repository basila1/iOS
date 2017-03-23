//
//  AddItemViewController.swift
//  BucketList_CoreData
//
//  Created by Basila Nathan on 3/22/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import Foundation
import UIKit

class AddItemViewController: UIViewController {
    
    var cancelDelegate: cancelDelegate?
    var doneDelegate: doneDelegate?
    
    var textToUpdate: String?
    var indexToUpdate: Int?
    
    @IBOutlet weak var userInputField: UITextField!
    
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        
        print ("cancel pressed")
        cancelDelegate?.cancelButtonPressed(controller: self)
    }
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        
        print ("done pressed")
        let info = userInputField.text!
        
        if let i = indexToUpdate {
            doneDelegate?.doneButtonPressedWithUpdate(controller: self, text: info, index: i)
            
        } else {
        
        doneDelegate?.doneButtonPressed(controller: self, text: info)
        
        
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let text = textToUpdate {
            userInputField.text = text
            self.navigationItem.title = "Edit Item"
        }
    }
    
}
