//
//  Builder.swift
//  DesignPatterns
//
//  Created by Uday on 11/07/24.
//

import Foundation

//This pattern is particularly useful in scenarios where an object has many optional properties, or when the construction process involves multiple steps or validations.

// Let's consider a scenario in an iOS application where we need to construct a PizzaOrder object. The construction of this object involves multiple steps and validations because a pizza order can have various customizations such as size, crust type, toppings, and special instructions.

class PizzaOrder {
    enum Size {
        case small, medium, large
    }

    enum CrustType {
        case thin, thick, stuffed
    }

    let size: Size
    let crustType: CrustType
    let toppings: [String]
    let extraCheese: Bool
    let deliveryInstructions: String?

    private init(builder: PizzaOrderBuilder) {
        self.size = builder.size
        self.crustType = builder.crustType
        self.toppings = builder.toppings
        self.extraCheese = builder.extraCheese
        self.deliveryInstructions = builder.deliveryInstructions
    }

    class PizzaOrderBuilder {
        var size: Size
        var crustType: CrustType
        var toppings: [String] = []
        var extraCheese: Bool = false
        var deliveryInstructions: String?

        init(size: Size, crustType: CrustType) {
            self.size = size
            self.crustType = crustType
        }

        func addTopping(_ topping: String) -> PizzaOrderBuilder {
            self.toppings.append(topping)
            return self
        }

        func setExtraCheese(_ extraCheese: Bool) -> PizzaOrderBuilder {
            self.extraCheese = extraCheese
            return self
        }

        func setDeliveryInstructions(_ instructions: String) -> PizzaOrderBuilder {
            self.deliveryInstructions = instructions
            return self
        }

        func validate() throws {
            guard !toppings.isEmpty else {
                throw ValidationError.noToppings
            }

            guard toppings.count <= 5 else {
                throw ValidationError.tooManyToppings
            }
        }

        func build() throws -> PizzaOrder {
            try validate()
            return PizzaOrder(builder: self)
        }
    }

    enum ValidationError: Error {
        case noToppings
        case tooManyToppings
    }
}


//Usage:
let pizza = try? PizzaOrder.PizzaOrderBuilder(size: .large, crustType: .thin)
    .addTopping("Pepperoni, Sausage")
    .setExtraCheese(true)
    .setDeliveryInstructions("keep it spicey")
    .build()
