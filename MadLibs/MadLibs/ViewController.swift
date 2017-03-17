//
//  ViewController.swift
//  MadLibs
//
//  Created by Basila Nathan on 3/15/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func submitSegue(_ sender: UIBarButtonItem) {
    }

    @IBOutlet weak var madLibLabel: UILabel!
    var passedData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        madLibLabel.text = "hello"
        madLibLabel.text = passedData
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

