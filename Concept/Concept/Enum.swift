//
//  Enum.swift
//  Concept
//
//  Created by Uday on 31/01/24.
//

import Foundation

// an enumeration (or enum) is a type that consists of a group of related values. Enums enable you to define a common type for a group of related values and work with those values in a type-safe way within your code.

private class EnumExample {
    
    // Simple enum represent different types of fruits
    enum Fruit {
        case apple
        case banana
        case orange
        case grape
    }
    
    
    // Enum with assosiated types
    enum Animal {
        case dog(name: String, age: Int)
        case cat(name: String, color: String)
        case brid(species: String)
    }
    
    // Enum wiht raw value
    enum Direction: String {
        case north = "N"
        case south = "S"
        case east = "E"
        case west = "W"
    }
    
    // Enum with mehtods
    enum Weekday: Int {
        case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
        
        func description() -> String {
            switch self {
            case .sunday:
                return "Sunday"
            case .monday:
                return "Monday"
            case .tuesday:
                return "Tuesday"
            case .wednesday:
                return "Wednesday"
            case .thursday:
                return "Thursday"
            case .friday:
                return "Friday"
            case .saturday:
                return "Saturday"
            }
        }
    }
    
    fileprivate func usage() {
        //
        let favoriteFruit: Fruit = .banana
        print("My favorite fruit is \(favoriteFruit)")
        
        //
        let myPet: Animal = .dog(name: "tommy", age: 5)
        switch myPet {
        case .dog(name: let name, age: let age):
            print("I have a dog named \(name) who is \(age) years old.")
        case .cat(name: let name, color: let color):
            print("I have a cat named \(name) with \(color) fur.")
        case .brid(species: let species):
            print("I have a bird of species \(species).")
        }
        
        
        //
        let currentDirection: Direction = .north
        print("The current direction is \(currentDirection.rawValue)")
        
        //
        let selectedDay: Weekday = .sunday
        print(selectedDay.description())
    }
}
