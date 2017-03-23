//
//  doneDelegate.swift
//  BucketList_CoreData
//
//  Created by Basila Nathan on 3/22/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import Foundation
import UIKit

protocol doneDelegate: class {
    func doneButtonPressed(controller: UIViewController, text: String)
    func doneButtonPressedWithUpdate(controller: UIViewController, text: String, index: Int)
}
