//
//  4️⃣ Pagination.swift
//  iOS Assignment
//
//  Created by Aditya Mathur on 31/01/26.
//

import Foundation

struct Pagination: Codable {
    let page: Int
    let limit: Int
    let total: Int
}
