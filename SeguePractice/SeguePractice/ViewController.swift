//
//  ViewController.swift
//  SeguePractice
//
//  Created by Basila Nathan on 3/18/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var secondVC: secondViewController = segue.destination as! secondViewController
        
        secondVC.recievedString = firstTextField.text!
        
    }


}

