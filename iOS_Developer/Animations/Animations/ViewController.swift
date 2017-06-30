//
//  ViewController.swift
//  Animations
//
//  Created by Basila Nathan on 6/29/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func fadeInButton(_ sender: Any) {
        
        image.alpha = 0 //will make the image invisible
        
        UIView.animate(withDuration: 1, animations: {
            
            self.image.alpha = 1 //need to use self becuase its in a closure (closure is something thats not happening in the main thread)
            
        })
        
    }
    @IBAction func slideInButton(_ sender: Any) {
        
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y) //move the image off screen
        
        UIView.animate(withDuration: 2, animations: {
            
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
            
        })
        
    }
    @IBAction func growButton(_ sender: Any) {
        
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        UIView.animate(withDuration: 1, animations: {
            
            self.image.frame = CGRect(x: 100, y: 100, width: 300, height: 300)
            
        })
        
    }
    
    
    @IBOutlet weak var buttonText: UIButton!
    @IBOutlet weak var image: UIImageView!
    
    var counter = 1
    
    var isAnimating = false
    
    var timer = Timer()
    
    func animate() {
        
        image.image = UIImage(named: "frame_\(counter)_delay-0.08s.gif")
        
        counter += 1
        
        //loop back
        
        if counter == 24 {
            counter = 0
        }
        
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        
        if isAnimating {
            
            timer.invalidate()
            
            buttonText.setTitle("Start Animation", for: [])
            
            isAnimating = false
            
        } else {
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            
        buttonText.setTitle("Stop Animation", for: [])
            
        isAnimating = true
        
        print("next button pressed \(counter)!!")
            
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

