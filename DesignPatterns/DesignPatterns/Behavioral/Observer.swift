//
//  Observer.swift
//  DesignPatterns
//
//  Created by Uday on 11/07/24.
//

import Foundation

//The Observer Design Pattern is a behavioral pattern that defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically. This pattern is commonly used to implement distributed event handling systems.

//Define the Observer Protocol:
protocol Observer: AnyObject {
    func update(message: String)
}


//Define the Subject (Publisher) Protocol:
protocol Subject {
    func registerObserver(_ observer: Observer)
    func removeObserver(_ observer: Observer)
    func notifyObservers()
}


//Create the Subject Class:
class MessageService: Subject {
    private var observers: [Observer] = []
    private var message: String = ""

    func registerObserver(_ observer: Observer) {
        observers.append(observer)
    }

    func removeObserver(_ observer: Observer) {
        if let index = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: index)
        }
    }

    func notifyObservers() {
        for observer in observers {
            observer.update(message: message)
        }
    }

    func setMessage(_ message: String) {
        self.message = message
        notifyObservers()
    }
}

//Create a Concrete Observer Class:
class MessageSubscriber: Observer {
    private let name: String

    init(name: String) {
        self.name = name
    }

    func update(message: String) {
        print("\(name) received message: \(message)")
    }
}


private func usage() {
    // Create a message service instance
    let messageService = MessageService()

    // Create subscribers
    let subscriber1 = MessageSubscriber(name: "Subscriber 1")
    let subscriber2 = MessageSubscriber(name: "Subscriber 2")
    let subscriber3 = MessageSubscriber(name: "Subscriber 3")

    // Register subscribers
    messageService.registerObserver(subscriber1)
    messageService.registerObserver(subscriber2)
    messageService.registerObserver(subscriber3)

    // Set and send a message
    messageService.setMessage("Hello, observers!")

    // Output:
    // Subscriber 1 received message: Hello, observers!
    // Subscriber 2 received message: Hello, observers!
    // Subscriber 3 received message: Hello, observers!

}
