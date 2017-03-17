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
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
//        let userInput = [textField1.text, textField2.text, textField3.text, textField4.text]
        
        let userInput = textField1.text
        
//        let userInput2 = textField2.text
//        let userInput3 = textField3.text
//        let userInput4 = textField4.text
        
//        performSegue(withIdentifier: "goToEditViewController", sender: userInput)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goToEditViewController" {
            if let destination = segue.destination as? ViewController {
                destination.passedData = sender as? String
            }
//        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
