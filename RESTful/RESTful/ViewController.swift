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
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        let serverGUID = guid?.replacingOccurrences(of: "id:", with: "")
        try container.encode(serverGUID, forKey: .guid)
        try container.encode(name, forKey: .name)
        //and the rest
    }
    
    init (fron decoder : Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let val = try values.decode(String.self, forKey: .guid)
        guid = "id: \(val)"
        name = try values.decode(String.self, forKey: .name)
        //rest of the properties
        
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
    
    static func fetchAll(completionHandler: @escaping ([Music]) -> Void) {
        let urlString = DomainURL + "music/"
        
        //create url instance
        if let url = URL.init(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                print(String.init(data: data!, encoding: .ascii) ?? "no data")
                if let newMusic = try? JSONDecoder().decode([Music].self, from: data!) {
                    completionHandler(newMusic)
                }
                
            }
            task.resume()
        }
    }
    
    /*
     We're going to use the JSONEncoder instance to encode and get the data just like we saw before and then we'll set that as the HTTP body and send that up to the server and create a new instance.
     */
    
    func saveToServer() {
        //this is the url to post new instances too
        let urlString = DomainURL + "music/"
        
        //Now that we have our request using the property HTTP method we set it equal to the string POST. This is what's used in the restful API for creating new instances on the server.
        var req = URLRequest.init(url: URL.init(string: urlString)!)
        req.httpMethod = "POST"
        
        //This call to JSONEncoder encode with the self object creates the data representation of this instance. It'll put it as the HTTP body in our request and that's what we'll use to send to the server.
        req.httpBody = try? JSONEncoder().encode(self)
        
        let task = URLSession.shared.dataTask(with: req) { (data, response, error) in
            //we expect a string back that responds with an okay message. So we'll print that out, and assuming we get a success I won't check for there being an error. So we pass in the data that was returned from the server. Using the ASCII encoding, and then add a default value of no data in case the intialization returns a nil.
            debugPrint(String.init(data: data!, encoding: .ascii) ?? "no data")
        }
        task.resume()
        
    }
    
    func updateServer() {
        guard self.guid != nil else { return }

        //this is the url to put new instance too, need specific id for update
        let urlString = DomainURL + "music/id/\(self.guid!)"
        
        //Now that we have our request using the property HTTP method we set it equal to the string PUT. This is what's used in the restful API for updating an instance on the server.
        var req = URLRequest.init(url: URL.init(string: urlString)!)
        req.httpMethod = "PUT"
        
        //This call to JSONEncoder encode with the self object creates the data representation of this instance. It'll put it as the HTTP body in our request and that's what we'll use to send to the server.
        req.httpBody = try? JSONEncoder().encode(self)
        
        let task = URLSession.shared.dataTask(with: req) { (data, response, error) in
            //we expect a string back that responds with an okay message. So we'll print that out, and assuming we get a success I won't check for there being an error. So we pass in the data that was returned from the server. Using the ASCII encoding, and then add a default value of no data in case the intialization returns a nil.
            debugPrint(String.init(data: data!, encoding: .ascii) ?? "no data")
        }
        task.resume()
        
    }
    
    func deleteFromServer() {
        guard self.guid != nil else { return }
        
        //this is the url to delete new instance too, need specific id for delete
        let urlString = DomainURL + "music/id/\(self.guid!)"
        
        //Now that we have our request using the property HTTP method we set it equal to the string PUT. This is what's used in the restful API for updating an instance on the server.
        var req = URLRequest.init(url: URL.init(string: urlString)!)
        req.httpMethod = "DELETE"
        
        let task = URLSession.shared.dataTask(with: req) { (data, response, error) in
            //we expect a string back that responds with an okay message. So we'll print that out, and assuming we get a success I won't check for there being an error. So we pass in the data that was returned from the server. Using the ASCII encoding, and then add a default value of no data in case the intialization returns a nil.
            debugPrint(String.init(data: data!, encoding: .ascii) ?? "no data")
        }
        task.resume()
        
    }
    
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Music.fetchAll { (items) in
            for item in items {
                debugPrint(item.name ?? "no name")
            }
        }
        
        /*
         call to music's fetch function, which hits the server, returns the data for the object with id one and then our completion handler returns an instance of new music with all the data from that instance. So, just like we did in our closure above, we can print the data from new music.
         */
        
        Music.fetch(withId: 1) { (newMusic) in
            debugPrint(newMusic.music_url ?? "no url")
            
            newMusic.description = "new description"
            //newMusic.updateServer()
            newMusic.deleteFromServer()
            //newMusic.saveToServer()
            
            //implement encodable
//            if let musicData = try? JSONEncoder().encode(newMusic) {
//                //So, if I print music data, I should get the printout to the d book console of the size of this object
//                debugPrint(musicData)
//            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

