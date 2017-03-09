//
//  ViewController.swift
//  Tipster
//
//  Created by Basila Nathan on 3/8/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //label for the number
    @IBOutlet weak var numLabel: UILabel!
    
    //labels for the tip div
    @IBOutlet weak var tipPercent1: UILabel!
    @IBOutlet weak var tipPercent2: UILabel!
    @IBOutlet weak var tipPercent3: UILabel!
    @IBOutlet weak var tipAmount1: UILabel!
    @IBOutlet weak var tipAmount2: UILabel!
    @IBOutlet weak var tipAmount3: UILabel!
    @IBOutlet weak var totalAmount1: UILabel!
    @IBOutlet weak var totalAmount2: UILabel!
    @IBOutlet weak var totalAmount3: UILabel!
    
    @IBAction func tipSlider(_ sender: UISlider) {
    }
    
    @IBAction func groupSlider(_ sender: UISlider) {
    }
    
    
    //function for buttons pressed
    @IBAction func numberPressed(_ sender: UIButton) {
        print(sender.tag)
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

