//
//  Factory.swift
//  DesignPatterns
//
//  Created by Uday on 11/07/24.
//

import Foundation

/*
  Factory Design Pattern is a creational design pattern used to create objects without specifying the exact class of the object that will be created. Instead, it defines an interface for creating an object, but allows subclasses to alter the type of objects that will be created.
 
 The main idea behind the Factory Pattern is to use a factory method to handle the creation of objects. This method is typically defined in a super class and implemented by subclasses. This promotes loose coupling by ensuring that the client code does not have to be aware of the specific classes that it needs to instantiate.
 */



//real life example
protocol Vehicle {
    func rent()
}


class Car: Vehicle {
    func rent() {
        print("Renting a Car for up to 5 passengers")
    }
}

class Bike: Vehicle {
    func rent() {
        print("Renting a Bike for up to 2 passengers")
    }
}

class Bus: Vehicle {
    func rent() {
        print("Renting a Bus for up to 5 passengers")
    }
}



class RentVehicleFactory {
    static func createVehicle(for numberOfPassengers: Int) -> Vehicle {
        switch numberOfPassengers {
        case 0...2:
            return Bike()
        case 3...5:
            return Car()
        case 6...20:
            return Bus()
        default:
            fatalError("Invalid number of passengers")
        }
    }
}

//Usage
func getVehicle(for numberOfPassengers: Int) -> Vehicle {
    return RentVehicleFactory.createVehicle(for: numberOfPassengers)
}

/*
// Using the factory to rent vehicles based on number of passengers
let vehicle1 = getVehicle(for: 1)
vehicle1.rent()  // Output: Renting a Bike for up to 2 passengers

let vehicle2 = getVehicle(for: 4)
vehicle2.rent()  // Output: Renting a Car for up to 5 passengers

let vehicle3 = getVehicle(for: 20)
vehicle3.rent()  // Output: Renting a Bus for more than 20 passengers
*/
