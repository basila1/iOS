//
//  Person.swift
//  StarWars
//
//  Created by Basila Nathan on 4/13/18.
//  Copyright © 2018 Basila Nathan. All rights reserved.
//

import Foundation

struct Person {
    
    private let homeworldLink: String
    
    let birthYear: String
    let eyeColor: String
    let gender: String
    let hairColor: String
    let height: String
    let mass: String
    let name: String
    let skinColor: String
    
    init?(json: JSON) {
        guard let birthYear = json["birth_year"] as? String,
        let eyeColor = json["eye_color"] as? String,
        let gender = json["gender"] as? String,
        let hairColor = json["hair_color"] as? String,
        let height = json["height"] as? String,
        let homeworldLink = json["homeworld"] as? String,
        let mass = json["mass"] as? String,
        let name = json["name"] as? String,
        let skinColor = json["skin_color"] as? String
            else {return nil}
        
        self.homeworldLink = homeworldLink
        self.birthYear = birthYear
        self.eyeColor = eyeColor
        self.gender = gender
        self.hairColor = hairColor
        self.height = height
        self.mass = mass
        self.name = name
        self.skinColor = skinColor
    }
    
    func homeworld(_ completion: @escaping (String) -> Void) {
        NetwrokingService.shared.getHomeworld(homeWorldLink: homeworldLink) { (homeworld) in
            completion(homeworld)
        }
    }
    
}
