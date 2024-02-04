//
//  Document.swift
//  SampleTest
//
//  Created by Uday on 02/02/24.
//

import Foundation

struct Document: Codable {
    
    let abstract: String
    let source: String
    let webUrl: String
    let multimedia: [Multimedia]
    
    
    enum CodingKeys:String, CodingKey {
        case abstract
        case source
        case webUrl = "web_url"
        case multimedia
    }
    
    var sourceUrl: URL? {
        return URL(string: webUrl) ?? nil
    }
}
