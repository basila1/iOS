//
//  ViewController.swift
//  NinjaGold
//
//  Created by Basila Nathan on 3/8/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var farmLabel: UILabel!
    @IBOutlet weak var caveLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var casinoLabel: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score: \(currentScore)"
        farmLabel.isHidden = true
        caveLabel.isHidden = true
        houseLabel.isHidden = true
        casinoLabel.isHidden = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var currentScore = 0
    let colors: [UIColor] = [.red, .lightGray, .green, .yellow, .orange, .cyan]
    
    @IBAction func buildingButtonPressed(_ sender: UIButton) {
        print(sender.tag)
        let randomNumber = Int(arc4random_uniform(6))
        scoreLabel.backgroundColor = colors[randomNumber]
        if sender.tag == 1 {
            let gold = Int(arc4random_uniform(11) + 10)
            currentScore += gold
            farmLabel.text = "You earned \(gold) gold"
            farmLabel.isHidden = false
        }
        
        if sender.tag == 2 {
            let gold = Int(arc4random_uniform(6) + 10)
            currentScore += gold
            caveLabel.text = "You earned \(gold) gold"
            caveLabel.isHidden = false
        }
        
        if sender.tag == 3 {
            let gold = Int(arc4random_uniform(3) + 2)
            currentScore += gold
            houseLabel.text = "You earned \(gold) gold"
            houseLabel.isHidden = false
        }
        
        if sender.tag == 4 {
            let result = Int(arc4random_uniform(2))
            let gold = Int(arc4random_uniform(51))
                if result == 1 {
                    currentScore += gold
                    casinoLabel.text = "You earned \(gold) gold"
                    casinoLabel.isHidden = false
                } else {
                    currentScore -= gold
                    casinoLabel.text = "You lost \(gold) gold"
                    casinoLabel.isHidden = false
                        }
                    }
        scoreLabel.text = "Score: \(currentScore)"
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        currentScore = 0
        scoreLabel.text = "Score: \(currentScore)"
        farmLabel.isHidden = true
        caveLabel.isHidden = true
        houseLabel.isHidden = true
        casinoLabel.isHidden = true
        scoreLabel.backgroundColor = UIColor.white
    }
    

}

