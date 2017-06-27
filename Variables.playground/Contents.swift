//: Playground - noun: a place where people can play

import UIKit

// two ways to define a variable var and let
//var you can change its value with let you cant!!

var str = "Hello, playground"

str = "hi, playground"

let otherStr = "Hi, Basila"

//String 

let name = "Basila Nathan"

//combining strings

print("Hello " + name)

//integer - whole number

var myInt = 8

print(myInt * 2)

print(myInt + 100)

myInt = myInt + 1

myInt = myInt / 5

print("myInt has a value \(myInt)")

let age = 24
print("my name is \(name) and I am \(age) years old!!")

//Doubles - decimal

var a: Double = 8.73 //better to use double!
var b: Float = 8.73
var c = 7.12

print(a / c)

//print(a / b) wont work becuase cant combine two different types 
//print(myInt + a) will also not work

//can convert the myInt to a doulb instead

print(Double(myInt) + a)

//Boolean

let gameOver = false

var gameOverStr = String(gameOver)

let d: Double = 5.76
let e: Int = 8

print("the product of \(d) and \(e) is equal to \(d * Double(e))")










