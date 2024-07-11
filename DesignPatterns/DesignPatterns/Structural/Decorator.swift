//
//  Decorator.swift
//  DesignPatterns
//
//  Created by Uday on 11/07/24.
//

import Foundation

//Among iOS app patterns, there also is the one called Decorator. It adds the necessary behaviour and responsibilities to the object without modifying its code. It can be useful when, for example, we use third-party libraries and don’t have access to the source code.
//In Swift, there are two common implementations of this pattern: extensions и delegation.

//Let's consider a coffee shop where we can order different types of coffee and add various condiments to it, such as milk, sugar, and whipped cream. We will use the Decorator Design Pattern to dynamically add these condiments to the coffee.

protocol Coffee {
    func cost() -> Double
    func description() -> String
}

class SimpleCoffee: Coffee {
    func cost() -> Double {
        return 5.0
    }

    func description() -> String {
        return "Simple coffee"
    }
}


class CoffeeDecorator: Coffee {
    private let decoratedCoffee: Coffee

    init(decoratedCoffee: Coffee) {
        self.decoratedCoffee = decoratedCoffee
    }

    func cost() -> Double {
        return decoratedCoffee.cost()
    }

    func description() -> String {
        return decoratedCoffee.description()
    }
}


class MilkDecorator: CoffeeDecorator {
    override func cost() -> Double {
        return super.cost() + 1.5
    }

    override func description() -> String {
        return super.description() + ", milk"
    }
}

class SugarDecorator: CoffeeDecorator {
    override func cost() -> Double {
        return super.cost() + 0.5
    }

    override func description() -> String {
        return super.description() + ", sugar"
    }
}

class WhippedCreamDecorator: CoffeeDecorator {
    override func cost() -> Double {
        return super.cost() + 2.0
    }

    override func description() -> String {
        return super.description() + ", whipped cream"
    }
}


//Use the Decorators to Create Different Coffees:
// Simple coffee
func usage(){
    var coffee: Coffee = SimpleCoffee()
    print("\(coffee.description()): $\(coffee.cost())")  // Output: Simple coffee: $5.0
    
    // Coffee with milk
    coffee = MilkDecorator(decoratedCoffee: coffee)
    print("\(coffee.description()): $\(coffee.cost())")  // Output: Simple coffee, milk: $6.5
    
    // Coffee with milk and sugar
    coffee = SugarDecorator(decoratedCoffee: coffee)
    print("\(coffee.description()): $\(coffee.cost())")  // Output: Simple coffee, milk, sugar: $7.0
    
    // Coffee with milk, sugar, and whipped cream
    coffee = WhippedCreamDecorator(decoratedCoffee: coffee)
    print("\(coffee.description()): $\(coffee.cost())")  // Output: Simple coffee, milk, sugar, whipped cream: $9.0
}
