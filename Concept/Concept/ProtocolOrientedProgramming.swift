//
//  ProtocolOrientedProgramming.swift
//  Concept
//
//  Created by Uday on 28/01/24.
//

import Foundation

/*
 Protocol-Oriented Programming (POP) in Swift means using rules (protocols) to describe how things should behave, instead of just relying on the relationships between classes. It's like giving a set of instructions for what something can do, and then letting different things follow those instructions in their own unique ways. This helps make code more flexible, reusable, and easier to understand.
 */


// Protocol defining the sound-making behavior
protocol SoundMaker {
    func makeSound()
}


// Struct representing a Dog that makes a bark sound
struct Dog: SoundMaker {
    
    func makeSound() {
        print("Woof! Woof!")
    }
}

// Class representing a Bird that makes a chirp sound
class Bird: SoundMaker {
    
    func makeSound() {
        print("Chirp! Chirp!")
    }
}


// Enum representing a Car that makes an engine sound
enum Car: SoundMaker {
    case sportsCar, sedan, electric
    
    func makeSound() {
        switch self {
        case .sportsCar:
            print("Vroom! Vroom!")
        case .sedan: 
            print("Rumble Rumble")
        case .electric:
            print("Silent hum")
        }
    }
}

//Usage
fileprivate func usage() {
    let myDog = Dog()
    let myBird = Bird()
    let myCar = Car.sportsCar
    
    myDog.makeSound()  // Outputs: Woof! Woof!
    myBird.makeSound() // Outputs: Chirp! Chirp!
    myCar.makeSound()  // Outputs: Vroom! Vroom!
}
