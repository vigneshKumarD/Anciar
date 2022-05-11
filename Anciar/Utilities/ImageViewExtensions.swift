//
//  ImageViewExtensions.swift
//  Anciar
//
//  Created by Vignesh Kumar on 5/10/22.
//

import Foundation
import UIKit

extension UIImageView {
    func imageWithURL(_ urlString: String?, placeholderImage: UIImage? = UIImage(named: ""),
                      contentMode: ContentMode = .scaleAspectFill) {
        self.image = placeholderImage
        guard let confirmedURLString = urlString,
              let confirmedURL = URL(string: confirmedURLString) else {
            self.image = placeholderImage
            return
        }
        
        self.contentMode = contentMode
        
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: confirmedURL) { data, response, error in
                guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                      let data = data, error == nil,
                      let image = UIImage(data: data) else {
                    DispatchQueue.main.async { [weak self] in
                        self?.image = placeholderImage
                    }
                    return
                }
                DispatchQueue.main.async { [weak self] in
                    self?.image = image
                }
            }.resume()
        }
    }
}
