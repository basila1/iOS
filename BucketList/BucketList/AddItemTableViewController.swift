//
//  AddItemTableViewController.swift
//  BucketList
//
//  Created by Basila Nathan on 3/9/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {
    
    var indexPath: NSIndexPath?
    var item: String?
    
    weak var delegate: CancelButtonDelegate?
    
    @IBOutlet weak var itemTextField: UITextField!

    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let item = itemTextField.text!
        delegate?.saveButtonPressed(by: self, with: item, at: indexPath)
    }
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
        print("cancel")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTextField.text = item
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}
