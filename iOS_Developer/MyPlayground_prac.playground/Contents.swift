//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var posts=[Dictionary<String,Dictionary<String,AnyObject>>]()

var post=Dictionary<String,AnyObject>()
var attachment=Dictionary<String,AnyObject>()
    
post=["id":"a", "label":"b"]
attachment=["id":"c", "image":"d"]
var newPost = ["post":post, "attachment":attachment]

posts.extend(newPost)

print(newPost)

