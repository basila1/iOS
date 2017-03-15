//
//  ViewController.swift
//  NorthSouthEastWest
//
//  Created by Basila Nathan on 3/14/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func directionButtonPressed(_ sender: UIButton) {
        
//        if sender.tag == 1 {
//            let northLabel = "North"
//        }
//        if sender.tag == 2 {
//            let eastLabel = "East"
//        }
//        if sender.tag == 1 {
//            let southLabel = "South"
//        }
//        if sender.tag == 1 {
//            let westLabel = "West"
//        }
        performSegue(withIdentifier: "goToDisplayViewController", sender: sender.titleLabel?.text!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let direction = sender as! String
        let controller = segue.destination as! displayViewController
        controller.direction = direction
        
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

