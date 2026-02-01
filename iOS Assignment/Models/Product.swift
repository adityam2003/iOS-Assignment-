//
//  Product.swift
//  iOS Assignment
//
//  Created by Aditya Mathur on 31/01/26.
//

import Foundation

struct Product: Decodable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let brand: String
    let stock: Int
    let image: String
    let specs: Specs
    let rating: Rating
}


