//
//  DependencyInjection.swift
//  Concept
//
//  Created by Uday on 16/02/24.
//

import Foundation

//protocol defining a math operation
protocol MathOperation {
    func performOperation(_ operand1: Double, _ operand2: Double) -> Double
}


//concrete implementation of MathOperation
class AdditionalOperation: MathOperation {
    func performOperation(_ operand1: Double, _ operand2: Double) -> Double {
        return operand1 + operand2
    }
}


class SubtractionOperation: MathOperation {
    func performOperation(_ operand1: Double, _ operand2: Double) -> Double {
        return operand1 - operand2
    }
}



// Calculator class that dependes on MathOperation
class Calculator {
    private let mathOperation: MathOperation
    
    // Dependency injection through the init
    init(mathOperation: MathOperation) {
        self.mathOperation = mathOperation
    }
    
    func calculate(_ operand1: Double, operand2: Double) -> Double {
        return mathOperation.performOperation(operand1, operand2)
    }
}


fileprivate func test() {
    // Example of usage
    let additionOperation = AdditionalOperation()

    // Injecting the dependency into calculator
    let calculatorWithAddition = Calculator(mathOperation: additionOperation)
    
    let resultAddition = calculatorWithAddition.calculate(5.0, operand2: 3.0)
    print("Addition Result: \(resultAddition)")
    
    
    let subtractionOperation = SubtractionOperation()
    let calculatorWithSubtraction = Calculator(mathOperation: subtractionOperation)
    let resultSubtraction = calculatorWithSubtraction.calculate(10.0, operand2: 2.0)
    print("Subtraction Result: \(resultSubtraction)")
}
