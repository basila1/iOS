//
//  ViewController.swift
//  BeastList_CoreData
//
//  Created by Basila Nathan on 3/20/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var userInput: UITextField! //for the text field
    
    
    @IBOutlet weak var tableView: UITableView! //for the table view
    
    var items = [ItemObject]() //create an array of items in the bigenning.
    
    //linking the database
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext //link to database. object that allows you to add and retrive stuff from the database.
    
    
    //loading the view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self //linking up the table view.
        tableView.delegate = self
        grabAllData() //grab all data
        // Do any additional setup after loading the view, typically from a nib.
    }

    //Add button pressed 
    
    @IBAction func addPressed(_ sender: Any) { //for the add button
        
        let text = userInput.text! //let text = userinput
        
        userInput.text = "" //set it to an empty string
        
        let item = NSEntityDescription.insertNewObject(forEntityName: "ItemObject", into: managedObjectContext) as! ItemObject //new instance of the item object class. now you have access to it.
        
        item.name = text //created the object which has a name attribute
        
        items.append(item)
        
        tableView.reloadData()
        
        saveData() //save the data after you append and reload.
    }
    
    //populate the table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return an integer that indicated how many rows (cells) to draw
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get the UITableViewCell and create/populate it with data then retun it
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell")! //DQ the cell
        cell.textLabel?.text = items[indexPath.row].name! //have access to the cell
        
        return cell
    }
    
    //delete a cell

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        print(indexPath)
        managedObjectContext.delete(items[indexPath.row])
        
        items.remove(at: indexPath.row)
        tableView.reloadData()
        
        saveData()
    }
    
    //core data methods
    
    func grabAllData(){ //go to manage object context, update it and reload it.
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ItemObject")
        
        do {
            
            let result = try managedObjectContext.fetch(request)
            
            items = result as! [ItemObject]
            
            tableView.reloadData()
            
        }catch{
            print(error)
        }
        
    }
    
    //save data
    
    func saveData() {
        do {
            try managedObjectContext.save()
        }catch {
            print(error)
        }
    }
}

