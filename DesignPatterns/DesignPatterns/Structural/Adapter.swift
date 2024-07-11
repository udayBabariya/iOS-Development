//
//  Adapter.swift
//  DesignPatterns
//
//  Created by Uday on 11/07/24.
//

import Foundation


/*You should use the Adapter design pattern
* when you want to use a third-party class but its interface doesn’t match the rest of your application’s code;
* when you need to use several existing subclasses but they lack particular functionality and, on top of that, you can’t extend the superclass.
*/


/*Adapting a Third-Party Library for Networking
Assume you are using a third-party networking library that has a different interface than your app's networking layer.*/

//Third-Party Library Interface:

class ThirdPartyNetworkService {
    func makeRequest(url: String) -> String {
        return "Third-party response from \(url)"
    }
}

//Your App's Networking Interface:
protocol NetworkService {
    func fetchData(from url: String) -> String
}


//Adapter Implementation:
class NetworkServiceAdapter: NetworkService {
    private let thirdPartyService: ThirdPartyNetworkService
    
    init(thirdPartyService: ThirdPartyNetworkService) {
        self.thirdPartyService = thirdPartyService
    }
    
    func fetchData(from url: String) -> String {
        return thirdPartyService.makeRequest(url: url)
    }
}

//Using the Adapter:
private func usage() {
    
    let thirdPartyService = ThirdPartyNetworkService()
    let networkService: NetworkService = NetworkServiceAdapter(thirdPartyService: thirdPartyService)
    
    print(networkService.fetchData(from: "https://example.com")) // Output: Third-party response from https://example.com
}
//In this example, the Adapter pattern allows your app to use the third-party library without changing its own networking interface, providing a seamless integration.
