//
//  PropertyWrapper.swift
//  Concept
//
//  Created by Uday on 01/02/24.
//

import Foundation

@propertyWrapper
struct UpperCased {
    
    var value: String = ""
    
    var wrappedValue: String {
        get {
            return value
        }
        
        set {
            value = newValue.uppercased()
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
}



fileprivate func usage() {
    
    struct Person {
       @UpperCased var firstName: String
       @UpperCased var lastName: String
   }
    
    var person = Person(firstName: "uday", lastName: "babariya")
    print(person.firstName) // Output: UDAY
    print(person.lastName)  // Output: BABARIYA
}

