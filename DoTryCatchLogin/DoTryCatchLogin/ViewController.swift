//
//  ViewController.swift
//  DoTryCatchLogin
//
//  Created by Basila Nathan on 4/16/18.
//  Copyright © 2018 Basila Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    enum LoginError: Error {
        case incompleteForm
        case invalidEmail
        case incorrectPasswordLength
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        //because login throws, need to use do try catch
        
        do {
            try login()
            //if login is sucessfull transition to next screen
        } catch LoginError.incompleteForm {
            Alert.showBasic(title: "Incomplete Form", message: "Please fill out both email and password fields", vc: self)
        } catch LoginError.incorrectPasswordLength {
            Alert.showBasic(title: "Incorrect Password Length", message: "Password should be at least eight characters long", vc: self)
        } catch LoginError.invalidEmail {
            Alert.showBasic(title: "Invalid Email", message: "Please make sure you format your email correctly", vc: self)
        } catch {
            Alert.showBasic(title: "Unable to Login", message: "There was an error when attemting to login", vc: self)
        }
    }
    
    func login() throws {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        if email.isEmpty || password.isEmpty {
            throw LoginError.incompleteForm
        }
        
        if !email.isValidEmail {
            throw LoginError.invalidEmail
        }
        
        if password.characters.count < 8 {
            throw LoginError.incorrectPasswordLength
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

