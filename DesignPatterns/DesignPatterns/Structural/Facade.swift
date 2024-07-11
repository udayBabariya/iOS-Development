//
//  Facade.swift
//  DesignPatterns
//
//  Created by Uday on 11/07/24.
//

import Foundation

//It offers one simplified interface for complex systems. Instead of showing numerous methods with different interfaces, we should create our own class while encapsulating other objects in it to provide a user with a more simplified interface.

//This pattern is useful when you have to replace, for example, Alamofire with NSURLSession. You should make a change only in your Facade class without editing its interface.

//Later, I can replace it with something else and I won’t have to make changes in all the places where it was used. It ill be enough to edit only one class

