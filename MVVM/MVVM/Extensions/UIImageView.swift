//
//  UIImageView.swift
//  SampleTest
//
//  Created by Uday on 02/02/24.
//

import UIKit

extension UIImageView {
    func setImage(url: URL, placeholder: UIImage?) {
        self.image = placeholder

        Task { [weak self] in
            let (data, _) = try await URLSession.shared.data(from: url)
            self?.image = UIImage(data: data)
        }
    }
}
