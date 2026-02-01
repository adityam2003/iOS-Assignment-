//
//  ImageLoader.swift
//  iOS Assignment
//
//  Created by Aditya Mathur on 31/01/26.
//

import UIKit

final class ImageLoader {

    static let shared = ImageLoader()

    private let cache = NSCache<NSString, UIImage>()

    private init() {}

    func loadImage(from urlString: String, into imageView: UIImageView) {

        imageView.image = UIImage(named: "4.jpg")

        if let cachedImage = cache.object(forKey: urlString as NSString) {
            imageView.image = cachedImage
            return
        }

        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard
                let self = self,
                let data = data,
                let image = UIImage(data: data)
            else {
                return
            }

            self.cache.setObject(image, forKey: urlString as NSString)

            DispatchQueue.main.async {
                imageView.image = image
            }
        }.resume()
    }
}
