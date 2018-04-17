//
//  Batter.swift
//  ComplexNestedData
//
//  Created by Basila Nathan on 4/17/18.
//  Copyright © 2018 Basila Nathan. All rights reserved.
//

import Foundation

struct Batter {
    
    let id: String
    let type: String
    
    init?(json: JSON) {
        print(json)
        guard let id = json["id"] as? String,
        let type = json["type"] as? String
            else { return nil }
        
        self.id = id
        self.type = type
        
    }
}
