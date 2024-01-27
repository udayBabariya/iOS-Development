//
//  Generics.swift
//  Concept
//
//  Created by Uday on 27/01/24.
//

import Foundation

// Example of Generic function
func swapValues<T> (_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

//Example of generic Class
class Stack<Element> {
    private var elements: [Element] = []
    
    func push(_ element: Element) {
        elements.append(element)
    }
    
    func pop() -> Element? {
        elements.popLast()
    }
    
    func peek() -> Element? {
        elements.last
    }
    
    func isEmpty() -> Bool {
        return elements.isEmpty
    }
}



//Example of Generic Struct
struct Pair<T, U> {
    var first: T
    var second: U
}

//Example of generic function and classes
func swapValuesUsingGenericFunction() {
    var number1 = 1
    var number2 = 2
    swapValues(&number1, &number2)
    print("number1: \(number1), number2:\(number2)")
}

func genericClass() {
    let stringStack = Stack<String>()
    stringStack.push("Swift")
    stringStack.push("SwiftUI")
    
    while let element = stringStack.pop() {
        print(element)
    }
}

func genericStruct() {
    let pair = Pair(first: 10, second: "20")
    print(pair.first)
    print(pair.second)
}

