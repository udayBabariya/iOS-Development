//
//  AsyncAwait.swift
//  Concept
//
//  Created by Uday on 12/07/24.
//

import Foundation


//In Swift, async and await are keywords introduced to support asynchronous programming, allowing developers to write asynchronous code that is easier to read and maintain.

// They help in writing non-blocking code that is easier to read and maintain by allowing asynchronous code to be written in a synchronous style.

/*
 async: Marks a function as asynchronous, indicating it can pause execution to wait for an asynchronous operation to complete.
 await: Used to pause the execution of an asynchronous function until the awaited asynchronous operation completes.
 */


//Declaring an Async Function:
fileprivate func fetchData() async -> String {
    return ""
}

// Usage
fileprivate func performTask() async  {
//    Task {
        let data = await fetchData()
//    }
}






//Error Handling:

fileprivate func fetchDataWithError() async throws ->  String {
    let someCondition = Bool.random()
    if someCondition {
        throw NetworkError.NoData
    }
    return ""
}

fileprivate func PerformTaskWithError() async throws {
    do {
        let data = try await fetchDataWithError()
        print(data)
    } catch {
        print(error.localizedDescription)
    }
}





// multiple async in concurrent way

fileprivate func performConcurrentTasks() async {
    do{
        async let task1 = fetchDataWithError()
        async let task2 = fetchDataWithError()
        
        let (result1, result2) = try await (task1, task2)
        print("fetched data1 : \(result1)")
        print("fetched data2 : \(result2)")
    } catch {
        print(error.localizedDescription)
    }
    
}





























/// use GCD for similar context

private func usageOfGCD() {
    // Simulate a possible error
    enum NetworkError: Error {
        case invalidURL
        case noData
    }
    
    func fetchFirstData(completion: @escaping (Result<String,Error>) ->Void) {
        DispatchQueue.global().async {
            completion(.success("Data1"))
        }
    }
    
    func fetchSecondData(completion: @escaping (Result<String,Error>)->Void) {
        DispatchQueue.global().async {
            completion(.success("Data2"))
        }
    }
    
    
    
    func fetchAllData() {
        let dispatchGroup = DispatchGroup()
        var firstResult: Result<String,Error>?
        var secondResult: Result<String,Error>?
        
        dispatchGroup.enter()
        fetchFirstData { result in
            firstResult = result
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        fetchSecondData { result in
            secondResult = result
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            do {
                let result1 = try firstResult?.get()
                let result2 = try secondResult?.get()
                print("Fetched data: \(result1 ?? ""), \(result2 ?? "")")
            } catch {
                print(error)
            }
        }
        
    }
}
