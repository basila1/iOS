//
//  ViewController.swift
//  AlamofireSwiftyJSON
//
//  Created by Basila Nathan on 4/11/18.
//  Copyright © 2018 Basila Nathan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class TableViewController: UITableViewController {
    
    var arrRes = [[String: AnyObject]]() //array of dictionary
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")
        var dict = arrRes[indexPath.row]
        cell?.textLabel?.text = dict["name"] as? String
        cell?.detailTextLabel?.text = dict["email"] as? String
        return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://api.androidhive.info/contacts/")
        Alamofire.request(url!).responseJSON { (responseData) in
            print(responseData)
            print("~~~~~~~~~~~~~~~~~~~~~~~~")
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print(swiftyJsonVar)
            
                    if let resData = swiftyJsonVar["contacts"].arrayObject {
                        self.arrRes = resData as! [[String : AnyObject]]
                    }
                    if self.arrRes.count > 0 {
                        self.tableView.reloadData()
                    }
                }
            }
    }
}


