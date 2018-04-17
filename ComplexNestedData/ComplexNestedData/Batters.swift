//
//  Batters.swift
//  ComplexNestedData
//
//  Created by Basila Nathan on 4/17/18.
//  Copyright © 2018 Basila Nathan. All rights reserved.
//

import Foundation

struct Batters {
    
    let batters: [Batter]
    
    init?(json: JSON) {
        //print(json)
        guard let batterJSON = json["batter"] as? [JSON] else { return nil }
        //looping through batterJSON becuase it's an array of JSON and for each json object we are ceating a Batter object
        let batters = batterJSON.map({ Batter(json: $0)! })
        self.batters = batters
    }
    
}
