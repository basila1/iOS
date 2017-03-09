//
//  ViewController.swift
//  TicTacToe
//
//  Created by Basila Nathan on 3/8/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var reset: UIButton!
    
    var activePlayer = 1 //red
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winnings = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerLabel.isHidden = true
        reset.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func tilePressed(_ sender: UIButton) {
        print(sender.tag)
        if gameState[sender.tag - 1] == 0 && gameIsActive == true {
            gameState[sender.tag - 1] = activePlayer
            if activePlayer == 1 {
                sender.backgroundColor = UIColor.red
                activePlayer = 2
            } else {
                sender.backgroundColor = UIColor.black
                activePlayer = 1
                
            }
        }
        for combination in winnings{
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                gameIsActive = false
                
                if gameState[combination[0]] == 1  {
                    winnerLabel.text = "Red has won!!"
//                    for i in 1...9 {
//                        let button = view.viewWithTag(i) as! UIButton //setting each one to be a button and setting the background color to be white.
//                        button.backgroundColor = UIColor.red
//                    }
                    
//                    winnerLabel.backgroundColor = UIColor.red
                } else {
                    winnerLabel.text = "Black has won!!"
//                    for i in 1...9 {
//                        let button = view.viewWithTag(i) as! UIButton //setting each one to be a button and setting the background color to be white.
//                        button.backgroundColor = UIColor.black
//                    }
//                    winnerLabel.backgroundColor = UIColor.black

                }

                winnerLabel.isHidden = false
                reset.isHidden = false
            }
        }
        
        gameIsActive = false
        
        for i in gameState {
            if i == 0 {
                gameIsActive = true
                break
            }
        }
        if gameIsActive == false {
            winnerLabel.text = "It's a draw!"
            winnerLabel.isHidden = false
            reset.isHidden = false
        }

    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        winnerLabel.isHidden = true
        reset.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton //setting each one to be a button and setting the background color to be white.
            button.backgroundColor = UIColor.lightGray
        }
        
    }
    
    
    
    

}

