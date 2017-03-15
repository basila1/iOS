//
//  ViewController.swift
//  BucketList
//
//  Created by Basila Nathan on 3/9/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class BucketListViewController: UITableViewController, CancelButtonDelegate {
    
    var items = ["travel", "dance", "learn a new language", "swim in the amazon"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
        
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print ("catsss")
        let navigationController = segue.destination as! UINavigationController
        let addItemTableController = navigationController.topViewController as! AddItemTableViewController
        addItemTableController.delegate = self
        print ("dogggssss")
        if segue.identifier == "EditItemSegue" {
            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row]
            addItemTableController.item = item
            addItemTableController.indexPath = indexPath
            print ("yayyyyy")
        }
        
        
    }
    
    func cancelButtonPressed(by controller: AddItemTableViewController)  {
    dismiss(animated: true, completion: nil)
    }
    
    func saveButtonPressed(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?) {
        if let ip = indexPath {
            items[ip.row] = text
        } else {
            items.append(text)
        }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    


}

