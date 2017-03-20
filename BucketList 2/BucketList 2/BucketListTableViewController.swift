//
//  ViewController.swift
//  BucketList 2
//
//  Created by Basila Nathan on 3/18/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class BucketListTableViewController: UITableViewController, CancelDelegate, DoneDelegate {
    
    var list = ["get black belt", "finish ios"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //creating the table view

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print("row was \(indexPath.row)")
        
        performSegue(withIdentifier: "editItem", sender: indexPath)
        
    }
    
    //segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nav = segue.destination as! UINavigationController
        
        let controller = nav.topViewController as! AddItemViewController
        
        controller.cancelDelegateVariable = self
        controller.doneDelegateVariable = self //WHY???
        
        if segue.identifier == "editItem" {
            print("in edit item")
            
            let indexPath = sender as! IndexPath
            
            controller.indexOfItemToEdit = indexPath.row
            controller.textOfItemToEdit = list[indexPath.row]
            
        }
        
    }
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        print("delete item at index \(indexPath.row)")
        
        list.remove(at: indexPath.row)
        self.tableView.reloadData()
    }
    
    
    //protocl methods
    
    func cancelButtonPressed(controller: UIViewController) {
        dismiss(animated: true, completion: nil) //dismissies the modal view. 
    }
    
    func doneButtonPressed(controller: UIViewController, text: String) {
        //we have access to the text, want to append it to the list, reload the table view, dismiss the view. 
        
        list.append(text) //text that came from the other view page
        self.tableView.reloadData()
        
        dismiss(animated: true, completion: nil)
    }
    
    func doneButtonPressedWithEdit(controller: UIViewController, text: String, index: Int) {
        //you have the text and index of the item you want to update. coming from protocol.
        
        list[index] = text
        self.tableView.reloadData()
        dismiss(animated: true, completion: nil)
        
        //when the button is pressed, we are going to go into the list, witht the index that we got, and set the text. reload the data, dismiss the modal that was presented.
    }


}

