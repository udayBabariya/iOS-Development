//
//  DesignPatterns.swift
//  DesignPatterns
//
//  Created by Uday on 31/01/24.
//
 

/*
 Design patterns are general reusable solutions to common problems encountered in software design. They represent best practices evolved over time by experienced software developers. Here is a list of some common types of design patterns:

 
 Creational Patterns:
     1. Singleton Pattern: Ensures a class has only one instance and provides a global point of access to it.
 
     2. Factory Method Pattern: Defines an interface for creating an object but leaves the choice of its type to the subclasses, creating instances of different classes.
     
    3. Abstract Factory Pattern: Provides an interface for creating families of related or dependent objects without specifying their concrete classes.
     
    4. Builder Pattern: Separates the construction of a complex object from its representation, allowing the same construction process to create different representations.
 
    5. Prototype Pattern: Creates new objects by copying an existing object, known as the prototype.
 
 
 
 Structural Patterns:
     
    1. Adapter Pattern: Allows the interface of an existing class to be used as another interface, converting one interface into another.
    
    2. Bridge Pattern: Separates an abstraction from its implementation so that the two can vary independently.
     
    3. Composite Pattern: Composes objects into tree structures to represent part-whole hierarchies.
     
    4. Decorator Pattern: Attaches additional responsibilities to an object dynamically. Decorators provide a flexible alternative to subclassing for extending functionality.
     
    5. Facade Pattern: Provides a simplified interface to a set of interfaces in a subsystem, making the subsystem easier to use.
     
    6. Flyweight Pattern: Minimizes memory usage or computational expenses by sharing as much as possible with related objects; it's often used to manage and reduce redundancy when storing large numbers of objects.
 
 
 
 Behavioral Patterns:
 
    1. Observer Pattern: Defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically.
     
    2. Strategy Pattern:  Defines a family of algorithms, encapsulates each one, and makes them interchangeable. Strategy lets the algorithm vary independently from clients that use it.
     
    3. Command Pattern: Encapsulates a request as an object, thereby allowing for parameterization of clients with different requests, queuing of requests, and logging of the parameters for requests.
     
    4. State Pattern: Allows an object to alter its behavior when its internal state changes. The object will appear to change its class.
    
     5. Chain of Responsibility Pattern:   Passes a request along a chain of handlers. Upon receiving a request, each handler decides either to process the request or to pass it along to the next handler in the chain.
     
    6. Interpreter Pattern: Defines a grammar for interpreting the sentences in a language and provides an interpreter to interpret the sentences.
     
    7. Mediator Pattern:  Defines an object that encapsulates how a set of objects interact. Mediator promotes loose coupling by keeping objects from referring to each other explicitly.
     
    8. Memento Pattern: Captures and externalizes an object's internal state so that the object can be restored to this state later.
     
    9. Visitor Pattern: Represents an operation to be performed on the elements of an object structure. It lets you define a new operation without changing the classes of the elements on which it operates.
 
 
 
 These design patterns are categorized into creational, structural, and behavioral patterns based on their purpose and the problem they solve. Choosing the right design pattern for a given problem can lead to more maintainable, scalable, and efficient software systems.
 */
