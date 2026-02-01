//
//  ProductsResponse.swift
//  iOS Assignment
//
//  Created by Aditya Mathur on 31/01/26.
//

import Foundation

struct ProductsResponse: Decodable {
    let data: [Product]
    let pagination: Pagination
}
