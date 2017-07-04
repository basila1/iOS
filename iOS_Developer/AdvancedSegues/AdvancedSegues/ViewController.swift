//
//  ViewController.swift
//  AdvancedSegues
//
//  Created by Basila Nathan on 7/4/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit


//create a global variable. Can access it in view did load and also in other view controllers!

let globalVariable = "Basila"

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //to pass informatio of which cell was tapped. we can create a variable 
    
    var activeRow = 0
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = "Row \(indexPath.row)"
        
        return cell
        
    }
    
    //initiate a segue when a particular row is taped
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        activeRow = indexPath.row
        
        performSegue(withIdentifier: "toSecondViewController", sender: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //happens just before a segue takes place!!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondViewController" {
            
            //create a variable to represent the view controller itself
            
            let secondViewController = segue.destination as! SecondViewController
            
            secondViewController.activeRow = activeRow
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

