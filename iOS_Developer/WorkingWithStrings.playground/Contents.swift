//: Playground - noun: a place where people can play

import UIKit

var str = "Hello"

var newString = str + " Basila"

//loop through each of the characters

for character in newString.characters {
    print(character)
}

let newTypeString = NSString(string: newString)

newTypeString.substring(to: 5)

newTypeString.substring(from: 6)
