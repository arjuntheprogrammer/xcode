//: Playground - noun: a place where people can play

import UIKit

let diceRoll = arc4random_uniform(6)

var i=1

while i<=10 {
    
    i=i+1
}


var array = [1,2,3,4,55,6]

for number in array{
    print (number)
    
}


for (index, number) in array.enumerated(){
    array[index] += 1
}

print (array)




