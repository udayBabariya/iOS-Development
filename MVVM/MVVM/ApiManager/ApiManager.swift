//
//  ApiManager.swift
//  SampleTest
//
//  Created by Uday on 02/02/24.
//

import Foundation


class ApiManager {
    
    private init() {}
    
    static let shared  = ApiManager()
    
    func getDocuments( url: URL, completion: @escaping (Result<[Document],Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data else {
                // handle error
                completion(.failure(ApiError.someError))
                return
            }
            
            do {
                let apiResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
                let response = apiResponse.response
                let documents = response.docs
                completion(.success(documents))
            }
            catch {
                completion(.failure(ApiError.someError))
            }
        }
        .resume()
    }
}
