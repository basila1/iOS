//
//  BucketItem+CoreDataProperties.swift
//  BucketList_CoreData
//
//  Created by Basila Nathan on 3/22/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension BucketItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BucketItem> {
        return NSFetchRequest<BucketItem>(entityName: "BucketItem");
    }

    @NSManaged public var name: String?

}
