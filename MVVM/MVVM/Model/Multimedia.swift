//
//  Multimedia.swift
//  SampleTest
//
//  Created by Uday on 02/02/24.
//

import Foundation

struct Multimedia: Codable {
    let url: String
    
    var fullUrl: URL? {
        return URL(string: API.baseUrl + url) ?? nil
    }
}
