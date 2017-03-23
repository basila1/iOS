//
//  ViewController.swift
//  BucketList_CoreData
//
//  Created by Basila Nathan on 3/22/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit
import CoreData
import Foundation


class BucketListTableViewController: UITableViewController, cancelDelegate, doneDelegate {
    
        let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items = [BucketItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //need to grab all items
        grabAllData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return an integer that indicated how many rows (cells) to draw
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get the UITableViewCell and create/populate it with data then retun it
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bucketCell")!
        cell.textLabel?.text = items[indexPath.row].name!
        
        return cell
    }
    
    //Delegates
    
    func cancelButtonPressed(controller: UIViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func doneButtonPressed(controller: UIViewController, text: String) {
        
        let item = NSEntityDescription.insertNewObject(forEntityName: "BucketItem", into: managedObjectContext) as! BucketItem
        
        item.name = text
        
        
        items.append(item)
        tableView.reloadData()
        
        dismiss(animated: true, completion: nil)
        saveData()
    }
    
    func doneButtonPressedWithUpdate(controller: UIViewController, text: String, index: Int) {
        items[index].name = text
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
        saveData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nav = segue.destination as! UINavigationController
        
        let controller = nav.topViewController as! AddItemViewController //you are accessing the cancel delegate. ASKKKKKKK!!!!!
        
        controller.cancelDelegate = self
        controller.doneDelegate = self
        
        if segue.identifier == "editItem" {
            let indexPath = sender as! IndexPath
            
            controller.indexToUpdate = indexPath.row
            controller.textToUpdate = items[indexPath.row].name!
        }
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print ("the row you clicked on is \(indexPath.row)")
        
        performSegue(withIdentifier: "editItem", sender: indexPath) //sending the data through
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        managedObjectContext.delete(items[indexPath.row])
        items.remove(at: indexPath.row)

        saveData()
        tableView.reloadData()
        
    }
    
    func saveData() {
        
        do {
            try managedObjectContext.save()
        } catch {
            print(error)
        }
    }
    
    func grabAllData(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "BucketItem")
        do {
            let result = try managedObjectContext.fetch(request)
            
            items = result as! [BucketItem]
            
            tableView.reloadData()
        }catch{
            print(error)
        }
    }

}

