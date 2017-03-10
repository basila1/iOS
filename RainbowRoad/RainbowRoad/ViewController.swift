//
//  ViewController.swift
//  RainbowRoad
//
//  Created by Basila Nathan on 3/9/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        self.tableView.rowHeight = 120
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
//        cell.textLabel?.text = "\(indexPath.row)"
        if ( indexPath.row == 0) {
            cell.backgroundColor = UIColor.red
        }
        if ( indexPath.row == 1) {
            cell.backgroundColor = UIColor.orange
        }
        if ( indexPath.row == 2) {
            cell.backgroundColor = UIColor.yellow
        }
        if ( indexPath.row == 3) {
            cell.backgroundColor = UIColor.green
        }
        if ( indexPath.row == 4) {
            cell.backgroundColor = UIColor.blue
        }
        if ( indexPath.row == 5) {
            cell.backgroundColor = UIColor.purple
        }
        return cell
    }
    

}

