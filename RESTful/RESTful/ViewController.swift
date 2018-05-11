//
//  ViewController.swift
//  RESTful
//
//  Created by Basila Nathan on 5/11/18.
//  Copyright © 2018 Basila Nathan. All rights reserved.
//

import UIKit

let DomainURL = "https://www.orangevalleycaa.org/api/"

class Music: Codable {
    
    var guid: String?
    var music_url: String?
    var name: String?
    var description: String?
    
    //mismatch of property keys?
    enum CodingKeys: String, CodingKey {
        case guid = "id"
        case music_url, name, description
    }
    
    //fetch data froms server
    static func fetch(withId id: Int, completionHandler: @escaping (Music) -> Void) {
        
        let urlString = DomainURL + "music/id/\(id)"
        
        //create url instance
        if let url = URL.init(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                print(String.init(data: data!, encoding: .ascii) ?? "no data")
                
                // USING JSON SERIALIZATION
                
//                if let objectData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) {
//                    //if parsing was successfull, we now have the json object
//                    //check if json abject is array or dictionary
//                    if let dict = objectData as? [String : Any] {
//                        //create an instance of Music
//                        let newMusic = Music()
//                        //then specify properties on that
//                        newMusic.id = dict["id"] as? String
//                        newMusic.name = dict["name"] as? String
//                        newMusic.music_url = dict["music_url"] as? String
//                        newMusic.description = dict["description"] as? String
//                        debugPrint(newMusic.music_url)
//                    }
//                }
                
                //USING THE CODABLE PROTOCOL
                //use instance of json decoder
                if let newMusic = try? JSONDecoder().decode(Music.self, from: data!) {
                    debugPrint(newMusic.guid ?? "no id")
                    debugPrint(newMusic.music_url ?? "no url")
                    completionHandler(newMusic)
                }
                
            }
            task.resume()
        }
        
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*
         call to music's fetch function, which hits the server, returns the data for the object with id one and then our completion handler returns an instance of new music with all the data from that instance. So, just like we did in our closure above, we can print the data from new music.
         */
        
        Music.fetch(withId: 1) { (newMusic) in
            debugPrint(newMusic.music_url ?? "no url")
            
            //implement encodable
            if let musicData = try? JSONEncoder().encode(newMusic) {
                //So, if I print music data, I should get the printout to the d book console of the size of this object
                debugPrint(musicData)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

