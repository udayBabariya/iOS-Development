//
//  PropertyWrapper.swift
//  Concept
//
//  Created by Uday on 01/02/24.
//

import Foundation

// property wrapper is a powerful feature that allows you to define common behavior for properties in a reusable way. Property wrappers provide a mechanism to encapsulate the logic that you want to apply to a property, such as validation, transformation, or synchronization. By defining a property wrapper, you can apply this logic to any property in a consistent and declarative manner.

@propertyWrapper
struct UpperCased {
    
    var value: String = ""
    
    var wrappedValue: String {
        get {
            return value
        }
        
        set {
            value = newValue.uppercased()
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
}



fileprivate func usage() {
    
    struct Person {
       @UpperCased var firstName: String
       @UpperCased var lastName: String
   }
    
    var person = Person(firstName: "uday", lastName: "babariya")
    print(person.firstName) // Output: UDAY
    print(person.lastName)  // Output: BABARIYA
}



fileprivate func usage2() {
    
    @propertyWrapper
    struct userDefaults<T> {
        private let key: String
        private let defaultValue: T
        
        init(key: String, defaultValue: T) {
            self.key = key
            self.defaultValue = defaultValue
        }
        
        var wrappedValue: T {
            get {
                UserDefaults.standard.value(forKey: key) as? T ?? defaultValue
            }
            set {
                UserDefaults.standard.setValue(newValue, forKey: key)
            }
        }
        
        var projectedValue: userDefaults<T> {
            return self
        }
        
        func remove() {
            UserDefaults.standard.removeObject(forKey: key)
        }
    }
    
    
    
    
    struct Settings {
        @userDefaults(key: "username", defaultValue: "Guest") var username: String
        @userDefaults(key: "age", defaultValue: 18) var age: Int
        @userDefaults(key: "isLoggedIn", defaultValue: false) var isLoggedIn: Bool
    }
    
    var settings = Settings()
    print(settings.username) // Output: Guest
    settings.username = "Uday"
    print(settings.username) // Output: Uday
    
    
    print(settings.age)  // Output: 18
    settings.age = 25
    print(settings.age)  // Output: 25
    
    
    print(settings.isLoggedIn)  // Output: false
    settings.isLoggedIn = true
    print(settings.isLoggedIn)  // Output: true

    // Remove values using the projected value
    settings.$username.remove()
    settings.$age.remove()
    settings.$isLoggedIn.remove()

    // Verify removal
    print(settings.username)  // Output: Guest (default value)
    print(settings.age)       // Output: 18 (default value)
    print(settings.isLoggedIn) // Output: false (default value)
}
