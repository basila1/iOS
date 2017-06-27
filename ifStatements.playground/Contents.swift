//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let age = 13

if age >= 18 {
    
    print("you can play!!")
    
} else {
    
    print("you're too young")
    
}

//Check username

let name = "Basila"

if name == "Basila" {
    
    print("Hi \(name), you can play!!")
    
} else {
    
    print("sorry \(name), you can't play")
    
}

//2 if statements with and

if name == "Basila" && age >= 18 {
    print("you can play")
} else if name == "Basila" {
    print("youre to young to play")
}

//2 if statements with or

if name == "Basila" || name == "Saloni" {
    print("Welcome \(name)")
}

//Booleans with if statments

let isFemale = true

if isFemale {
    print("you are a female!!")
}

//username and password check

let username = "basila_n"

let password = "google"

if username == "basila_n" && password == "google" {
    print("You are in!!")
} else if username != "basila_n" && password != "google" {
    print("username and password are icorrect")
} else if username == "basila_n" {
    print("password is wrong!!")
} else {
    print("username is wrong!!")
}























