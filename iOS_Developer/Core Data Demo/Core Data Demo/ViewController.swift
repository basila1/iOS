//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Basila Nathan on 10/11/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//


//Entity- table in a database (users)
//Attributes- columns of the spreadsheet (username, password, age)
//appDelegate- functions that control big events of the app (app loading)
//
//Create appDelegate variable to refer to the app delegate
//Create context variable to refer to the persistent container context
//create a new user object which allows us to insert a new object inside the Users entity
//Set various values for that new user
//save the context within a do try catch
//
//Restore data from core data using request (ns fetch request)
//Use do catch to fetch results from core data

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        /*
         
        //make a new user
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue("Karanvir", forKey: "username")
        newUser.setValue("myPass", forKey: "password")
        newUser.setValue(29, forKey: "age")
        
        //save the user
        do {
            try context.save()
            print("saved!")
        } catch {
            print("there was an error")
        }
 
         */
 
        //fetch users
    
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        //request.predicate = NSPredicate(format: "username = %@", "Tanjeev")
        
        //request.predicate = NSPredicate(format: "age < %@", "30")

        
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let username = result.value(forKey: "username") as? String {
                        //print(username)
                        
                        //changing the value of username
                        
//                        result.setValue("Shruthi", forKey: "username")
//
//                        do {
//                            try context.save()
//                        } catch {
//                            print("rename failed")
//                        }
                        
                        //deleting a usernmae
                        
//                        context.delete(result)
//
//                        do {
//                            try context.save()
//                        } catch {
//                            print("delete failed")
//                        }
                        
                        
                        print(username)
                    }
                }
            } else {
                print("no users")
            }
        } catch {
            print("could not fetch results!")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

