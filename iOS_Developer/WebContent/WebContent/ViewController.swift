//
//  ViewController.swift
//  WebContent
//
//  Created by Basila Nathan on 6/28/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        
//        let url = URL(string: "https://www.stackoverflow.com")!
//        
//        webView.loadRequest(URLRequest(url: url))
//        
//        webView.loadHTMLString("<h1>Basila Nathan</h1>", baseURL: nil)
        
        if let url = URL(string: "https://www.stackoverflow.com") {
            
            let request = NSMutableURLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                if error != nil {
                    
                    print(error)
                    
                } else {
                    if let unwrappedData = data {
                        
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        
                        print(dataString)
                        
                    }
                }
            }
            
            
            task.resume()
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

