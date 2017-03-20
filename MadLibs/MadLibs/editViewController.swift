//
//  editViewController.swift
//  MadLibs
//
//  Created by Basila Nathan on 3/15/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class editViewController: UIViewController {
    
    
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    
    weak var delegate: MadLibDelegate?
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        let userInput = [textField1.text, textField2.text, textField3.text, textField4.text]
        delegate?.itemSaved(controller: self, text: userInput as! [String])
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
}
