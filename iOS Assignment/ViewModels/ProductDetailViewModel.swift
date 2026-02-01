//
//  ProductDetailViewModel.swift
//  iOS Assignment
//
//  Created by Aditya Mathur on 31/01/26.
//

import Foundation

final class ProductDetailViewModel {

    private let product: Product

    init(product: Product) {
        self.product = product
    }

    var title: String {
        product.title
    }

    var priceText: String {
        "₹\(product.price)"
    }

    var description: String {
        product.description
    }

    var category: String {
        product.category
    }

    var brand: String {
        product.brand
    }

    var stockText: String {
        "In stock: \(product.stock)"
    }

    var ratingText: String {
        "⭐️ \(product.rating.rate) (\(product.rating.count))"
    }

    var imageURL: URL? {
        URL(string: product.image)
    }

    var specsSummary: [String] {
        let mirror = Mirror(reflecting: product.specs)

        return mirror.children.compactMap { child in
            guard
                let key = child.label,
                let value = child.value as? CustomStringConvertible
            else {
                return nil
            }

            return "\(key.capitalized): \(value)"
        }
    }
}
