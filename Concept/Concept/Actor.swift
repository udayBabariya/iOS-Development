//
//  Actor.swift
//  Concept
//
//  Created by Uday on 15/02/24.
//


/*
 
 The actor keyword in Swift is used to define a special kind of class that is designed to safely encapsulate state and behavior in a concurrent programming environment.
 
 Actors provide a way to avoid data races and protect mutable state by ensuring that access to the actor's properties and methods is serialized through an actor's queue.
 */

import Foundation

fileprivate class User {
    
    let id: String
    let name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

fileprivate class UserStorage {
    private var store = [String: User]()
    
    func get(_ id: String) -> User? {
        return store[id]
    }
    
    func save(_ user: User) {
        store[user.id] = user
    }
}

//issue - race condition





fileprivate class UserStorage2 {
    private var store = [String: User]()
    private let queue = DispatchQueue(label: "userStorageQueue")
    
    func get(_ id: String) -> User? {
        queue.sync {
            return store[id]
        }
    }
    
    func save(_ user: User) {
        queue.sync {
            store[user.id] = user
        }
    }
}



fileprivate func test2() {
    let user = User(id: "1", name: "Uday")
    let storage = UserStorage2()
    storage.save(user)
    let get =  storage.get("1")
}





fileprivate actor UserStorage3 {
    private var store = [String: User]()
    
    func get(_ id: String) -> User? {
        return store[id]
    }
    
    func save(_ user: User) {
        store[user.id] = user
    }
}


fileprivate func test3() {
    Task {
        let user = User(id: "1", name: "Uday")
        let storage = UserStorage3()
        await storage.save(user)
        let get = await storage.get("1")
    }
}
