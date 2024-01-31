//
//  PrivateSet.swift
//  Concept
//
//  Created by Uday on 31/01/24.
//

import Foundation

private class PrivateSet {
    
     class Person {
        private var name: String
        
        init(name: String) {
            self.name = name
        }
    }
    
    func test() {
        let person = Person(name: "Person")
        //person.name - cannot access
    }
    
    
    
    
    class Person2 {
        
        public private(set) var name: String // allow to access but not allow to set the value
        
        init(name: String) {
            self.name = name
        }
    }
    
    func test2(){
        let person2 = Person2(name: "Person2")
        print(person2.name)
    }
}
