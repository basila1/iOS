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


class SwipeViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    
    @IBAction func swipeButtonPressed(_ sender: UIButton) {
        showFriends(index: index)
        index = index + 1
        //index must not exceed length of friend list
    }
    
    var index = 0
    
    let ref = FIRDatabase.database().reference(withPath: )
    
    
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
//        showFriends(index: 0)
        
        
        // Do any additional setup after loading the view.
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(SwipeViewController.handleSwipes(sender:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(SwipeViewController.handleSwipes(sender:)))
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
    }

    func handleSwipes(sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            print ("Swipe left")
        }
        if sender.direction == .right {
            print ("Swipe right")
        }
    }
    
    
    func showFriends(index: Int) {
        
        
        let params = ["fields": "id, last_name, first_name, gender, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me/taggable_friends", parameters: params).start { (connection, result , error) -> Void in
            
            if error != nil {
                print(error!)
            }
            else {
                
            
//                print (result)
                let user = result as? [String: Any]
                if let data = user!["data"] as? [AnyObject] {
                    print(data[index])
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
                    if let fn = data[index]["first_name"] as? String {
                        fname = fn
                    }
                    if let ln = data[index]["last_name"] as? String {
                        lname = ln
                    }
                    self.textLabel.text = fname! + " " + lname!
                }
            }
        }
    }
    

    
}
