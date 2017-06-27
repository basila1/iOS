//
//  ViewController.swift
//  How_Many_Fingers
//
//  Created by Basila Nathan on 6/26/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var fingersTextField: UITextField!
    
    @IBAction func guessButtonPressed(_ sender: Any) {
        
        let diceRoll = String(arc4random_uniform(6))
        
        if fingersTextField.text == diceRoll {
            resultLabel.text = "Youre right"
        } else {
            resultLabel.text = "Wrong, It was \(diceRoll)."
        }
        
    }
    
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

