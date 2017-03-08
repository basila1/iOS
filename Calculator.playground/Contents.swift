//: Playground - noun: a place where people can play

import UIKit

class Calculator {
    var total: Double = 0.0
    
    func clear() {
        self.total = 0.0 //clears the calculators total
    }
    
    //Add value to the total
    
    func addToTotal (value: Double) -> Double{
        self.total += value
        return self.total
    }
    
    //Subtract value from the total
    
    func subFromTotal (value: Double) -> Double {
        self.total -= value
        return self.total
    }
    
    //Divide valuef from the total
    
    func divideIntoTotal (value: Double) -> Double {
        self.total /= value
        return self.total
    }
    
    //Multiply value to total
    
    func multiplyToTotal (value: Double) -> Double {
        self.total *= value
        return self.total
    }
}

let a = Calculator()
a.addToTotal(value: 43)
a.multiplyToTotal(value: 2)
a.clear()
a.addToTotal(value: 20)
a.divideIntoTotal(value: 10)