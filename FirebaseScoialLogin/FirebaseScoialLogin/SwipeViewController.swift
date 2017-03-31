//
//  SwipeViewController.swift
//  FirebaseScoialLogin
//
//  Created by Basila Nathan on 3/29/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit
import FBSDKLoginKit
//import Koloda

class SwipeViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
//    @IBOutlet weak var kolodaView: KolodaView!
    
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
//        kolodaView.dataSource = self
//        kolodaView.delegate = self
        
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
//
//extension SwipeViewController: KolodaViewDelegate {
//    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
//        dataSource.reset()
//    }
//    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
//        UIApplication.sharedApplication().openURL(NSURL(string: "https://google.com/")!)
//    }
//}
//extension SwipeViewController: KolodaViewDataSource {
//    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
//        return 5
//    }
//    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
//        return UIImageView(image: images[index])
//    }
//    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
//        return NSBundle.mainBundle().loadNibNamed("OverlayView", owner: self, options: nil)[0] as? OverlayView
//    }
//}
