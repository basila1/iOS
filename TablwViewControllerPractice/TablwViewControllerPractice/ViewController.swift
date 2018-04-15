//
//  ViewController.swift
//  TablwViewControllerPractice
//
//  Created by Basila Nathan on 4/11/18.
//  Copyright © 2018 Basila Nathan. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let streets = ["Albemarle", "Brandywine", "Chesapeake"]
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return streets.count
    }
    
    

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = streets[indexPath.row]
        return cell
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

