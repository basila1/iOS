//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var i = 1

while i < 10 {
    
    print(i)
    
    i = i + 1
}

//display the first 20 numbers in the 7 times table

i = 1

while i < 20 {
    
    print(i * 7)
    i += 1
}

//use a while loop to add one to eah of the values in the array

var array = [7, 23, 98, 1, 0, 763]

i = 0
while i < array.count {
    
    array[i] += 1
    
    i += 1
}

print(array)