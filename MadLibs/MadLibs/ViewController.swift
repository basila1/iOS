//
//  ViewController.swift
//  MadLibs
//
//  Created by Basila Nathan on 3/15/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MadLibDelegate {
    
    
    @IBAction func submitSegue(_ sender: UIBarButtonItem) {
    }

    @IBOutlet weak var madLibLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        madLibLabel.text = "..."
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? editViewController
        destination?.delegate = self
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func itemSaved(controller: editViewController, text: [String]) {
        madLibLabel.text = "We are having a perfecty \(text[0]) time now.  Later we will \(text[1]) and \(text[2]) in the \(text[3])."
        
        dismiss(animated: true, completion: nil)
    }
    
    


}

