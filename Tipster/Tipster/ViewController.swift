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
    
    @IBOutlet weak var customTipPercentageSlider: UISlider!
    @IBOutlet weak var groupTextLabel: UILabel!
    
    
    @IBAction func tipPercentageSlider(_ sender: UISlider) {
        tipPercent1.text! = String(Int(sender.value) + 5) + "%"
        tipPercent2.text! = String(Int(sender.value) + 10) + "%"
        tipPercent3.text! = String(Int(sender.value) + 15) + "%"
        calculateTip()
    }
    
    func calculateTip() {
        let tip = Float(customTipPercentageSlider.value)
        let tipAmountA = Float(numLabel.text!)! * ((tip + 5)/100)
        let tipAmountB = Float(numLabel.text!)! * ((tip + 10)/100)
        let tipAmountC = Float(numLabel.text!)! * ((tip + 15)/100)
        let perPersonA = (Float(numLabel.text!)! + tipAmountA)/round(groupSliderLabel.value)
        let perPersonB = (Float(numLabel.text!)! + tipAmountB)/round(groupSliderLabel.value)
        let perPersonC = (Float(numLabel.text!)! + tipAmountC)/round(groupSliderLabel.value)
        
        

//        let totalA = tipAmountA + Float(numLabel.text!)!
//        let totalB = tipAmountB + Float(numLabel.text!)!
//        let totalC = tipAmountC + Float(numLabel.text!)!

        tipAmount1.text! = String(tipAmountA)
        tipAmount2.text! = String(tipAmountB)
        tipAmount3.text! = String(tipAmountC)
        
        totalAmount1.text! = String(perPersonA)
        totalAmount2.text! = String(perPersonB)
        totalAmount3.text! = String(perPersonC)

    }

    @IBOutlet weak var groupSliderLabel: UISlider!
    
    
    @IBAction func groupSlider(_ sender: UISlider) {

        calculateTip()
        let groupSize = Int(sender.value)
        groupTextLabel.text = "Group Size: \(groupSize)"
        
    }
    
    
    //function for buttons pressed
    @IBAction func numberPressed(_ sender: UIButton) {
        print(sender.tag)
        if sender.tag < 10 {
            numLabel.text = numLabel.text! + String(sender.tag)
        }
        if sender.tag == 11 {
            numLabel.text = numLabel.text! + String(".")
            sender.isEnabled = false
        }
        if sender.tag == 10 {
            numLabel.text = String("")
        }
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

