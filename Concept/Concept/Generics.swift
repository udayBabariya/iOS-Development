//
//  Generics.swift
//  Concept
//
//  Created by Uday on 27/01/24.
//

import Foundation


// Generics in Swift allow us to write functions and types that can work with any type. This is achieved by defining placeholder types that can be specified when the function or type is used. Generics enable us to write flexible and reusable code without sacrificing type safety.


// Example of Generic function
fileprivate func swapValues<T> (_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

//Example of generic Class
fileprivate class Stack<Element> {
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
fileprivate struct Pair<T, U> {
    var first: T
    var second: U
}

//Example of generic function and classes
fileprivate func swapValuesUsingGenericFunction() {
    var number1 = 1
    var number2 = 2
    swapValues(&number1, &number2)
    print("number1: \(number1), number2:\(number2)")
    
    
    var string1 = "1111"
    var string2 = "2222"
    swapValues(&string1, &string2)
    print("string1: \(string1), string2:\(string2)")
}



fileprivate func genericClass() {
    let stringStack = Stack<String>()
    stringStack.push("Swift")
    stringStack.push("SwiftUI")
    
    while let element = stringStack.pop() {
        print(element)
    }
}



fileprivate func genericStruct() {
    let pair = Pair(first: 10, second: "20")
    print(pair.first)
    print(pair.second)
}

