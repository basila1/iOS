//
//  ViewController.swift
//  TimerApp
//
//  Created by Basila Nathan on 6/27/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    
    var time = 210
    
    func decreaseTimer() {
        
        if time > 0 {
            
            time -= 1
            
            timerLabel.text = String(time)
            
        } else {
            
            timer.invalidate()
            
        }
    }

    @IBOutlet weak var timerLabel: UILabel!
    @IBAction func pauseButtonPressed(_ sender: Any) {
        print("pause")
        timer.invalidate()
    }
    
    @IBAction func playButtonPressed(_ sender: Any) {
        print("play")
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreaseTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func plusTen(_ sender: Any) {
        print("plus10")
        
        time += 10
        
        timerLabel.text = String(time)
    }
    @IBAction func minusTen(_ sender: Any) {
        print("minus10")
        
        if time > 10 {
            time -= 10
            
            timerLabel.text = String(time)
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        print("reset")
        
        time = 210
        
        timerLabel.text = String(time)
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

