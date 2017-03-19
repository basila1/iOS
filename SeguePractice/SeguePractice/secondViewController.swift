//
//  secondViewController.swift
//  SeguePractice
//
//  Created by Basila Nathan on 3/18/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    
    @IBOutlet weak var secondTextField: UILabel!
    
    var recievedString: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        secondTextField.text = recievedString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
