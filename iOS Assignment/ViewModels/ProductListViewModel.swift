//
//  ProductListViewModel.swift
//  iOS Assignment
//
//  Created by Aditya Mathur on 31/01/26.
//

import Foundation

final class ProductListViewModel {

    private(set) var products: [Product] = []

    var onDataUpdate: (() -> Void)?
    var onError: ((String) -> Void)?
    var onLoadingStateChange: ((Bool) -> Void)?

    private var currentPage = 0
    private let limit = 10
    private var totalItems = Int.max
    private var isLoading = false

    // MARK: - Products Fetch
    func fetchProducts() {

        guard !isLoading else { return }
        guard products.count < totalItems else { return }

        isLoading = true
        onLoadingStateChange?(true)

        APIClient.fetchProducts(page: currentPage, limit: limit) { [weak self] result in
            guard let self = self else { return }

            DispatchQueue.main.async {
                self.isLoading = false
                self.onLoadingStateChange?(false)

                switch result {

                case .success(let response):

                    guard !response.data.isEmpty else {
                        self.totalItems = self.products.count
                        return
                    }

                    self.products.append(contentsOf: response.data)
                    self.totalItems = response.pagination.total
                    self.currentPage += 1

                    self.onDataUpdate?()

                case .failure(let error):
                    self.onError?(self.mapError(error))
                }
            }
        }
    }

    func loadNextPageIfNeeded(currentIndex: Int) {
        if currentIndex >= products.count - 2 {
            fetchProducts()
        }
    }

    // MARK: - Helpers
    func numberOfItems() -> Int {
        return products.count
    }

    func product(at index: Int) -> Product {
        return products[index]
    }

    private func mapError(_ error: NetworkError) -> String {
        switch error {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data received"
        case .decodingError:
            return "Failed to parse data"
        case .serverError(let message):
            return message
        }
    }
}
