//
//  APIEndpoints.swift
//  iOS Assignment
//
//  Created by Aditya Mathur on 31/01/26.
//

import Foundation

enum APIEndpoints {

    static func products(page: Int, limit: Int) -> URL? {
        let urlString =
        "https://fakeapi.net/products?page=\(page)&limit=\(limit)&category=electronics"
        return URL(string: urlString)
    }
}
