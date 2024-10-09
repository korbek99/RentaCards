//
//  UtilsViews.swift
//  RentaCards
//
//  Created by Jose Preatorian on 09-10-24.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImages(from url: String) {
        guard let imageUrl = URL(string: url) else {
            print("Invalid URL: \(url)")
            return
        }

        self.image = nil

        let task = URLSession.shared.dataTask(with: imageUrl) { [weak self] data, response, error in
            if let error = error {
                print("Error loading image: \(error)")
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                print("Error: No data or unable to create image.")
                return
            }

            DispatchQueue.main.async {
                self?.image = image
            }
        }
        
        task.resume()
    }
}
