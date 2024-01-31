//
//  Defer.swift
//  Concept
//
//  Created by Uday on 31/01/24.
//

import Foundation

enum NetworkError: Error {
    case NoData
}


class DeferKeyword {
    
    func fetchDataWithOutDefer(url: URL, _ completion: @escaping (Result<Data,Error>) -> Void ) {
        
        URLSession.shared.dataTask(with: url) { data, _ , error in
            guard error == nil else {
               completion(.failure(error!))
                return
            }
            
            guard let data else {
                completion(.failure(NetworkError.NoData))
                return
            }
            
            completion(.success(data))
        }
        .resume()
    }
    
    
    func fetchData(url: URL, _ completion: @escaping (Result<Data,Error>) -> Void ) {
        
        URLSession.shared.dataTask(with: url) { data, _ , error in
            
            let result: Result<Data, Error>
            
            defer {
                completion(result)
            }
            
            guard error == nil else {
                result = .failure(error!)
                return
            }
            
            guard let data else {
                result = .failure(NetworkError.NoData)
                return
            }
            
            result = .success(data)
        }
        .resume()
    }
}
