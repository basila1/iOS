//
//  SwipeViewController.swift
//  FirebaseScoialLogin
//
//  Created by Basila Nathan on 3/29/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class SwipeViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    
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
        showFriends()
        
        
        // Do any additional setup after loading the view.
    }
    
    func showFriends() {
        
        let params = ["fields": "id, last_name, first_name, gender, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me/friends", parameters: params).start { (connection, result , error) -> Void in
            
            if error != nil {
                print(error!)
            }
            else {
                
            
                print (result)
                let user = result as? [String: Any]
                if let data = user!["data"] as? [AnyObject] {
                    for person in data {
                        if let picture = person["picture"] as? NSDictionary, let data = picture["data"] as? NSDictionary, let url = data["url"] as? String {
                            do {
                                let imageData = try Data(contentsOf: URL(string: url)!)
                                self.imageLabel.image = UIImage(data: imageData)
                                
                            } catch {
                                print(error)
                            }
                            
                            print(url)
                            
                        }
                        if let n = person["first_name"] as? String {
                            self.textLabel.text = n
                        }
                    }
                }
            }
        }
    }
    
  

    
}
