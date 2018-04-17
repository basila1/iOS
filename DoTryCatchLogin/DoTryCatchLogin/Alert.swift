//
//  Alert.swift
//  DoTryCatchLogin
//
//  Created by Basila Nathan on 4/16/18.
//  Copyright © 2018 Basila Nathan. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    class func showBasic(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
}
