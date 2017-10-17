//
//  ViewController.swift
//  API_JSON
//
//  Created by Basila Nathan on 10/12/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=fb4ef2a83513f8dba4633c97167d7504")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print(error)
            } else {
                if let urlContent = data {
                    do {
                        //Array
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        print(jsonResult)
                        
                        
                        if let weather = jsonResult["weather"] as? NSArray {
                            print("Weather Array~~~~~~~~~ \(weather)")
                            if let nestedDictionary = weather[0] as? NSDictionary {
                                print("Nested Dictionary~~~~~~~~~~~~ \(nestedDictionary)")
                                if let description = nestedDictionary["description"] as? String {
                                    print("Description~~~~~~~~~~~ \(description)")
                                }
                            }
                        }

//                        if let description = ((jsonResult["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
//                            print(description)
//                        }
                        
//                        if let dictionary = jsonResult as? [String: Any] {
//                            if let name = dictionary["name"] as? String {
//                                // access individual value in dictionary
//                                print(name)
//                            }
//
//                            if let nestedDictionary = dictionary["weather"] as? [String: Any] {
//                                // access nested dictionary values by key
//                                print(nestedDictionary)
////                                if let description = nestedDictionary["description"] as? [String: Any] {
////                                    print(description)
////                                }
//                            }
//                        }
                        
                    } catch {
                        print("JSON Serialization failed")
                    }
                }
            }
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

