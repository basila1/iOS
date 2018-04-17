//
//  ItemResponse.swift
//  ComplexNestedData
//
//  Created by Basila Nathan on 4/17/18.
//  Copyright © 2018 Basila Nathan. All rights reserved.
//

import Foundation

struct ItemResponse {
    
    let items: [Item]
    
    init?(json: JSON) {
        
        guard let items = json["items"] as? JSON else { return nil }
        //print(items)
        guard let itemArray = items["item"] as? [JSON] else { return nil }
        //print(itemArray)
        let itemObjects = itemArray.map({ Item(json: $0)! })
        //print(itemObjects)
        self.items = itemObjects
    }
}
