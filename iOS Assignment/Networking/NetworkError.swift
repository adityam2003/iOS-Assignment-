//
//  NetworkError.swift
//  iOS Assignment
//
//  Created by Aditya Mathur on 31/01/26.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case serverError(String)
}
