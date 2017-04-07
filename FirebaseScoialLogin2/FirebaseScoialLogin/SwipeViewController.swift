//
//  SwipeViewController.swift
//  FirebaseScoialLogin
//
//  Created by Basila Nathan on 3/29/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase
import FirebaseDatabase
import FirebaseAuth


class SwipeViewController: UIViewController {
    
    var ref = FIRDatabase.database().reference()
    
    var user = FIRAuth.auth()?.currentUser

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    var index = 0
    var friendListCount: Int = 0
    var id: String!
    var targetID: String!
    
    func moveToNextTarget() {
        if index < friendListCount - 1 {
            index += 1
        } else if index == friendListCount - 1 {
            index = 0
        }
        showFriends(index: index)
    }
    
    func currentUser() {
        var userID: String?
        let params = ["fields": "id, first_name, last_name, gender, email"]
        FBSDKGraphRequest(graphPath: "me", parameters: params).start { (connection, result , error) -> Void in
            if error != nil {
                print (error)
            }
            else {
                if let person = result as? [String: Any] {
                   userID = person["id"] as! String
                    self.id = userID!
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let alertController = UIAlertController(title: "", message: "Who are you interested in?", preferredStyle: .actionSheet)
//        let maleButton = UIAlertAction(title: "Male", style: .default, handler: {(action)->Void in
//            
//        })
//        let femaleButton = UIAlertAction(title: "Female", style: .default, handler: {(action)->Void in
//            
//        })
//        alertController.addAction(maleButton)
//        alertController.addAction(femaleButton)
//        self.present(alertController, animated: true, completion: nil)
        
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(SwipeViewController.handleSwipes(sender:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(SwipeViewController.handleSwipes(sender:)))
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        showFriends(index: 0)
        currentUser()
    }
    
//    func sexyTime () {
//        if
//        let alertController = UIAlertController(title: "YOU DID IT", message: "You have a match!", preferredStyle: .actionSheet)
//        self.present(alertController, animated: true, completion: nil)
//    }

    func handleSwipes(sender: UISwipeGestureRecognizer) {
        
        if sender.direction == .left {
            print ("Swipe left")
            moveToNextTarget()
        }
        if sender.direction == .right {
            self.ref.child("user_profile").child("\(id!)/\(targetID!)").setValue(true)
            moveToNextTarget()
        }
    }
    
    
    func showFriends(index: Int) {
        
        var n: Int?
        
        
        let params = ["fields": "id, last_name, first_name, gender, email, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me/friends", parameters: params).start { (connection, result , error) -> Void in
            
            if error != nil {
                print(error!)
            }
            else {
                
            
                let user = result as? [String: Any]
                if let data = user!["data"] as? [AnyObject] {
                    n = data.count
                    self.friendListCount = n!
//                    for person in data {
//                        if let picture = person["picture"] as? NSDictionary, let data = picture["data"] as? NSDictionary, let url = data["url"] as? String {
//                            do {
//                                let imageData = try Data(contentsOf: URL(string: url)!)
//                                self.imageLabel.image = UIImage(data: imageData)
//                                
//                            } catch {
//                                print(error)
//                            }
//                            
//                            
//                        }
//                        if let n = person["first_name"] as? String {
//                            self.textLabel.text = n
//                        }
//                    }
                    
                    if let picture = data[index]["picture"] as? NSDictionary, let data = picture["data"] as? NSDictionary, let url = data["url"] as? String {
                        do {
                            let imageData = try Data(contentsOf: URL(string: url)!)
                            self.imageLabel.image = UIImage(data: imageData)
                        } catch {
                            print (error)
                        }
                    }
                    var fname: String?
                    var lname: String?
                    var target: String?
                    if let fn = data[index]["first_name"] as? String {
                        fname = fn
                    }
                    if let ln = data[index]["last_name"] as? String {
                        lname = ln
                    }
                    
                    if let t = data[index]["id"] as? String {
                        target = t
                        
                        self.targetID = target
                        
                    }
                    self.textLabel.text = fname! + " " + lname!
                }
            }
        }
    }
    

    
}
