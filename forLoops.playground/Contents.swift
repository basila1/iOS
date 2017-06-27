//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let array = [8, 4, 8, 1]

for number in array {
    print(number)
}

//create an array of names and loop through it

let names = ["Basila", "Saloni", "Tanjeev", "Sarah"]

for name in names {
    print("Hi there, \(name)!!")
}

var numbers = [7, 2, 9, 4, 1]

for (index, value) in numbers.enumerated() {
    
    numbers[index] += 1
    
}

print(numbers)

var myArray = [Double]()

myArray = [8, 7, 19, 28]

for (index, value) in myArray.enumerated() {
    myArray[index] = value / 2
}

print(myArray)