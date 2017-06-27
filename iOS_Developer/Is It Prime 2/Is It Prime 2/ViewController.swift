//
//  ViewController.swift
//  Is It Prime 2
//
//  Created by Basila Nathan on 6/27/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    
    @IBAction func isPrimeButtonPressed(_ sender: Any) {
        
        if let userEnteredString = numberTextField.text {
            
            let userEnteredInteger = Int(userEnteredString)
            
            if let number = userEnteredInteger {
                
                
                var isPrime = true
                
                if number == 1 {
                    isPrime = false
                }
                
                var i = 2
                
                while i < number {
                    
                    if number % i == 0 {
                        isPrime = false
                    }
                    
                    i += 1
                }
                
                if isPrime {
                    
                    label.text = "\(number) is Prime!!"
                    
                } else {
                    
                    print("got here!")
                    
                    label.text = "\(number) is not Prime"
                    
                }
                
                
            } else {
                
                label.text = "Plese enter a positive while number!"
                
            }
            
        }
        
        
        
        
    }
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

