//
//  GetPeopleResponse.swift
//  StarWars
//
//  Created by Basila Nathan on 4/13/18.
//  Copyright © 2018 Basila Nathan. All rights reserved.
//

import Foundation

struct GetPeopleResponse {
    
    let people: [Person]
    
    init(json: JSON) throws {
        guard let results = json["results"] as? [JSON] else { throw NetworkingError.badNetworkingStuff } //array of people or array of json
        //pass in each JSON object to initialize the person
        //use map function which is same as for-in loop
        //initalize person with json, each object in results is a json so initialize a person with json -> $0 -> pass each object in
        let people = results.map{ Person(json: $0) }.flatMap{ $0 }
        self.people = people
        
    }
}
