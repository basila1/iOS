//
//  ViewController.swift
//  CallbacksThreading
//
//  Created by Basila Nathan on 4/15/18.
//  Copyright © 2018 Basila Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //userNames array
    var userNames = [String]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //getUsers()
//        getUsers {
//            /*
//             the completion code!!
//             when it hits completion in the below function
//             whatever code is in here is going to run like it's in the completion
//             */
//            print("Hello world")
//        }
        
        getUsers { (success, response, error) in
            if success {
                guard let names = response as? [String] else { return }
                print(names)
                self.userNames = names
                self.tableView.reloadData()
            } else if let error = error {
                print(error)
            }
        }
    }
    
    func getUsers(completion: (Bool, Any?, Error?) -> Void) {
        //read from file
        guard let path = Bundle.main.path(forResource: "someJSON", ofType: "txt") else { return }
        let url = URL(fileURLWithPath: path)
        //do try block
        do {
            let data = try Data(contentsOf: url)
            //make json out of the data
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            
            //our json is in an array of dictionaries
            guard let array = json as? [[String: Any]] else { return }
            
            //empty array of strings
            var names = [String]()
            
            //for each user add it to the names array
            for user in array {
                guard let name = user["name"] as? String else { continue }
                names.append(name)
            }
            //call the callback
            //pass names through the completion block
            completion(true, names, nil)
            //print(names)
            // how do we pass the names to the usernames or anywhere else -> CALLBACKS
            //CALLBACKS = COMPLETION HANDLERS
        } catch {
            print(error)
            completion(false, nil, error)
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userNames.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = userNames[indexPath.row]
        return cell
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

