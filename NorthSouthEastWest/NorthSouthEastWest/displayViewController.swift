//
//  displayViewController.swift
//  NorthSouthEastWest
//
//  Created by Basila Nathan on 3/14/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class displayViewController: UIViewController {
    
    @IBOutlet weak var goBackButton: UIButton!
    var direction: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        goBackButton.setTitle(direction, for: .normal
        )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
