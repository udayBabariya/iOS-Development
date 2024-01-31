//
//  Enum.swift
//  Concept
//
//  Created by Uday on 31/01/24.
//

import Foundation

private class EnumExample {
    
    // Simple enum represent different types of fruits
    enum Fruits {
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
        case nort = "N"
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
}
