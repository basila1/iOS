//
//  MadLibDelegate.swift
//  MadLibs
//
//  Created by Basila Nathan on 3/20/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import Foundation
import UIKit

protocol MadLibDelegate: class {
    func itemSaved (controller: editViewController, text: [String])
}
