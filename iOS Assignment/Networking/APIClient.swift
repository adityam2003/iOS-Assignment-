//
//  APIClient.swift
//  iOS Assignment
//
//  Created by Aditya Mathur on 31/01/26.
//

import Foundation

final class APIClient {

    static func fetchProducts(
        page: Int,
        limit: Int,
        completion: @escaping (Result<ProductsResponse, NetworkError>) -> Void
    ) {

        guard let url = APIEndpoints.products(page: page, limit: limit) else {
            completion(.failure(.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error {
                completion(.failure(.serverError(error.localizedDescription)))
                return
            }

            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            do {
                let decoded = try JSONDecoder().decode(ProductsResponse.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(.decodingError))
            }
        }

        task.resume()
    }
}
