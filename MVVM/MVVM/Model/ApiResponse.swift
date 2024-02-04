//
//  ApiResponse.swift
//  SampleTest
//
//  Created by Uday on 02/02/24.
//

import Foundation


struct ApiResponse: Codable {
    var status: String
    var response: Response
//    var json: Json
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case response = "response"
//        case json = "JSON"
    }
}

//struct Json: Codable {
//  
//}

struct Response: Codable {
    var docs: [Document]
}
