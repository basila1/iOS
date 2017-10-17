//
//  ViewController.swift
//  SimpleLogin
//
//  Created by Basila Nathan on 10/11/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    
    var isLoggedIn = false
    
    @IBAction func logOut(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        do {
            let results = try context.fetch(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    context.delete(result)
                    
                    do {
                        try context.save()
                    } catch {
                        print("individual delete failed")
                    }
                }
                label.alpha = 0
                logOutButton.alpha = 0
                //textField.alpha = 1
                //logInButton.alpha = 1
                logInButton.setTitle("Login", for: [])
                
                isLoggedIn = false
                
                textField.alpha = 1

            }
        } catch {
            print("delete failed")
        }
    }
    
    
    @IBAction func logIn(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        if isLoggedIn {
            //update the existing username
            
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            
            do {
                
                let results = try context.fetch(request)
                
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        result.setValue(textField.text, forKey: "name")
                        
                        do {
                            try context.save()
                        } catch {
                            print("update username failed")
                        }
                    }
                    
                    label.text = "Hello " + textField.text! + "!"
                }
                
            } catch {
                print("failed to update username")
            }
            
            
        } else {
            
            //setting the username
            
            let newValue = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
            
            newValue.setValue(textField.text, forKey: "name")
            
            do {
                try context.save()
                
                //textField.alpha = 0
                //logInButton.alpha = 0
                logInButton.setTitle("Update", for: [])
                logOutButton.alpha = 1
                label.alpha = 1
                
                label.text = "Hello " + textField.text! + "!"
                
                isLoggedIn = true
                
            } catch {
                print("failed to save user")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //access core data to find out wheter or not something has already been saved
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            
            for result in results as! [NSManagedObject] {
                if let username = result.value(forKey: "name") as? String {
                    
                    //textField.alpha = 1
                    logInButton.setTitle("Update", for: [])
                    logOutButton.alpha = 1
                    label.alpha = 1
                    
                    label.text = "Hello " + username + "!"
                    
                }
            }
        }catch {
            print("no users saved")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

