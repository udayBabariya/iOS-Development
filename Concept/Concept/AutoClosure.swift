//
//  AutoClosure.swift
//  Concept
//
//  Created by Uday on 28/01/24.
//

import Foundation


/*
 An autoclosure is a closure that's automatically created to wrap an expression that's being passed as an argument to a function. It doesn't take any arguments, and when it's called, it returns the value of the expression that's wrapped inside of it.
 */

class Logger {
    
    func log(_ message: String) {
        #if DEBUG
        print(message)
        #endif
    }
    
    func printURLRespone() {
        let urlResponse = URLResponse()
        log(urlResponse.url?.debugDescription ?? "no response")
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
        log({urlResponse.url?.debugDescription ?? "no response" })
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
        log(urlResponse.url?.debugDescription ?? "no response")
    }
}
