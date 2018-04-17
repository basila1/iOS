//
//  Item.swift
//  ComplexNestedData
//
//  Created by Basila Nathan on 4/17/18.
//  Copyright © 2018 Basila Nathan. All rights reserved.
//

import Foundation

struct Item {
    
    let batters: Batters
    
    init?(json: JSON) {
        //print(json)
        guard let battersJSON = json["batters"] as? JSON else { return nil }
        //getting batters and sticiking  batter into it
        self.batters = Batters(json: battersJSON)!
    }
    
}
