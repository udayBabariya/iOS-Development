//
//  ViewModel.swift
//  SampleTest
//
//  Created by Uday on 02/02/24.
//

import Foundation

class ViewModel {
    
    var documents: [Document] = []
    
    func getDocuments(completion: @escaping () -> ()) {
        
        guard let mainUrl = URL(string: API.mainURl) else {
            //handle error
            return
        }
        
        ApiManager.shared.getDocuments(url: mainUrl) { result in
            switch result {
            case .success(let documents):
                self.documents = documents
            case .failure(_): break
                //handle error
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    
    
}
