//
//  ViewController.swift
//  BeastList
//
//  Created by Basila Nathan on 3/9/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tasks = ["Bhangra", "Fashion Blog", "Coding Dojo", "iOS", "React", "Angular"]
    
    

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        if taskTextField.text != "" {
            tasks.append(taskTextField.text!)
            taskTextField.text = ""
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self //informing the table view that it should ask the view controller these questions
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
}
