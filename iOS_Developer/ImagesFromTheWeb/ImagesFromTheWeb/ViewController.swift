//
//  ViewController.swift
//  ImagesFromTheWeb
//
//  Created by Basila Nathan on 10/11/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var catImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/3/35/Lightmatter_snowleopard.jpg")!
        
        let request = URLRequest(url: url)
        print("catImage0")

        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (data, response, error) in
            print("catImage1")

            if error != nil {
                print(error)
            } else {
                if let data = data {
                    print("catImage2")

                    if let catImage = UIImage(data: data) {
                        
                        self.catImageView.image = catImage
                        
                        print("catImage3")
                        
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

