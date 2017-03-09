//
//  ViewController.swift
//  ColdCall
//
//  Created by Basila Nathan on 3/8/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var buttonColor: UIButton!
    

    
    let nameBank = ["Basila", "Tanjeev", "Saloni", "Poonam", "Karanvir", "Manish", "Shai"]
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let randomNumber = Int(arc4random_uniform(5) + 1)
        let currentName = Int(arc4random_uniform(8))
        if currentName < nameBank.count - 1 {
            nameLabel.text = nameBank[currentName]
        }
        numberLabel.text = String(randomNumber)
        numberLabel.isHidden = false
        
        if randomNumber == 1 || randomNumber == 2 {
            numberLabel.textColor = UIColor.red
        }
        else if randomNumber == 3 || randomNumber == 4 {
            numberLabel.textColor = UIColor.orange
        }
        else if randomNumber == 5 {
            numberLabel.textColor = UIColor.green
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Ready?"
        numberLabel.isHidden = true
       

    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

