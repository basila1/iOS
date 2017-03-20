//
//  AddItemViewController.swift
//  BucketList 2
//
//  Created by Basila Nathan on 3/20/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import Foundation
import UIKit

class AddItemViewController: UIViewController {
    
    
    @IBOutlet weak var userTextField: UITextField!
    
    //we create both these variablem because we need a reference to the previous page.
    
    var cancelDelegateVariable: CancelDelegate? //of the type cacnel delagate that we made. has to conform in order to have access. to get the attrobut need to go tohtough the navigation controller, and then the controller, and then attribute, set it to self. self is the bucket view controller but it conforms to cancel delegate.
    
    //this is the bucket view controller
    
    var doneDelegateVariable: DoneDelegate?
    
    var indexOfItemToEdit: Int?
    var textOfItemToEdit: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let item = textOfItemToEdit {
            userTextField.text = item
            self.navigationItem.title = "Edit Item"
        }
}

    @IBAction func cancelPressed(_ sender: Any) {
        
        print ("cancel pressed") //when the cancel button is pressed. it will acess the cancel delegate, and run the cnacel button pressed.
        
        cancelDelegateVariable?.cancelButtonPressed(controller: self)
        
    }
    @IBAction func donePressed(_ sender: Any) {
        print ("done pressed")
        
        let userInput = userTextField.text!
        //need to send the data back, and dismissed
        
        if let index = indexOfItemToEdit {
            doneDelegateVariable?.doneButtonPressedWithEdit(controller: self, text: userInput, index: index)
        } else {
            
        
        
        doneDelegateVariable?.doneButtonPressed(controller: self, text: userInput) //this method is in the previous page, and it contains the dismiss function. pass the input, before it dimisses the modal, it will take the input, append it to the array and reload the data.
            
         }   
        
        print(userInput)
    }
}
