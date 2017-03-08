//: Playground - noun: a place where people can play

import UIKit

class Thermometer {
    //convert fahrenheit to celsius
    func fahrenheitToCelsius (farenheit: Double) -> Double {
        return (farenheit - 32) * 5/9
    }
    //convert celsius to fahrenheit
    func celsiusToFahrenheit (celsius: Double) -> Double {
        return (celsius * 9) / 5 + 32
    }
}

print ("Testing")
let t = Thermometer()
print (t.celsiusToFahrenheit(celsius: 32))
print (t.fahrenheitToCelsius(farenheit: 32))