//
//  DoneDelegate.swift
//  BucketList 2
//
//  Created by Basila Nathan on 3/20/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import Foundation
import UIKit

protocol DoneDelegate: class {
    func doneButtonPressed(controller: UIViewController, text: String) //passing the string into the other views
    func doneButtonPressedWithEdit(controller: UIViewController, text: String, index: Int)
}
