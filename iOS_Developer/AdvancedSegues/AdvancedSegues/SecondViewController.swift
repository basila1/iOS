//
//  SecondViewController.swift
//  AdvancedSegues
//
//  Created by Basila Nathan on 7/4/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var username = "basila"
    
    var activeRow = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print(globalVariable)
        print(activeRow)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
