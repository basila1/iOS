//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var number: Int? //want to create a variable that doesnt have a value, add a ? at the end

print(number)

let userEnteredText = "4" //this can be optional -> eiter a 4 or a "four"

let userEnteretInteger = Int(userEnteredText)

if let catAge = userEnteretInteger { //have this line that tests weather there's a value
    
    print(catAge * 7)
    
} else {
    //show error message to the user!!
}