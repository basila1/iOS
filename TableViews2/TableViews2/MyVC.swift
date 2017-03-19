//
//  MyVC.swift
//  TableViews2
//
//  Created by Basila Nathan on 3/18/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class MyVC: UITableViewController {
    
    @IBOutlet var myTableView: UITableView!
    
    @IBAction func addEmployee(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add new Employee", message: "Enter Employee's Name", preferredStyle: UIAlertControllerStyle.alert)
        
        let save = UIAlertAction(title: "Save", style: .default) {
            (alertAction: UIAlertAction) in
            
            let newEmployee = alert.textFields?[0].text!
            
            self.data.append(newEmployee!)
            self.myTableView.reloadData()
            
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addTextField(configurationHandler: nil)
        
        alert.addAction(save)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    var data = ["Basila", "Saloni", "Tanjeev"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row];


        return cell
    }
    


}
