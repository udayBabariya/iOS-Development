//
//  Constants.swift
//  SampleTest
//
//  Created by Uday on 02/02/24.
//

import Foundation



struct API {
    static let mainURl = "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=election&api-key=j5GCulxBywG3lX211ZAPkAB8O381S5SM"
    static let baseUrl = "https://static01.nyt.com/"
}


//todo - can have all the cases
enum ApiError: Error {
    case someError
}
