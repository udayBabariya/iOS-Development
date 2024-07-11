//
//  AutoClosure.swift
//  Concept
//
//  Created by Uday on 28/01/24.
//

import Foundation


/*
 An autoclosure is a closure that's automatically created to wrap an expression that's being passed as an argument to a function. It doesn't take any arguments, and when it's called, it returns the value of the expression that's wrapped inside of it.
 It allows you to defer the evaluation of an expression until it's actually needed. This can be particularly useful for avoiding unnecessary computation or side effects until the result is truly required.
 */


class AutoClosureExample {
    
    func closure1(_ success: () -> String) {
        print(success())
    }
    
    func closure2(_ success: @autoclosure () -> String) {
        print(success())
    }
    
    //usage
    func usage() {
        closure1 {"Test1"}
        
        closure2("Test2")
    }
    
}






class LoggerWithoutAutoClouser {
    func log(_ message: () -> String) {
        #if DEBUG
        print(message())
        #endif
    }
    
    func printURLResponse() {
        let urlResponse = URLResponse()
        log({urlResponse.url?.debugDescription ?? "no response" }) // it is always evaluate the value of debugDescription no matter it is we are in debug mode or not.
    }
}



class LoggerWithAutoClosure {
    func log(_ message: @autoclosure () -> String) {
        #if DEBUG
        print(message())
        #endif
    }
    
    func printURLResponse() {
        let urlResponse = URLResponse()
        log(urlResponse.url?.debugDescription ?? "no response") // it will evaluate the value of debugDescription only if we are in debug mode.
    }
}
