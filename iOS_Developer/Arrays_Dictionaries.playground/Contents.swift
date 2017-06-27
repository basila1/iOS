//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Dictionary

var dictionary = ["computer": "something to play call of duty on", "coffee": "best drink ever"]

print(dictionary["computer"]!) //if you forsure know that computer has a value, use an exclamation mark to unwrap it

print(dictionary.count)

dictionary["pen"] = "google"

dictionary.removeValue(forKey: "computer")

print(dictionary)

var gameCharacters = [String: Double]() //create an empty dictionary, with name being the string and score being Double

gameCharacters["ghost"] = 8.7

let foodDictionary = ["pizza": 10.99, "ice cream": 4.99, "salad": 7.99]

print("the total cost of my meal is \(foodDictionary["pizza"]! * foodDictionary["ice cream"]!)")

//Array

var array = [35, 36, 5, 2]

print(array[2])

print(array.count)

array.append(1)

array.remove(at: 1)

array.sort()

print(array)

var array2 = [3.87, 7.1, 8.9]
array2.remove(at: 1)
array2.append(array2[0] * array2[1])

print(array2)

//let mixArray = ["Basila", 24, true]

let stringArray = [String]() //create an array which will contain some strings!!



