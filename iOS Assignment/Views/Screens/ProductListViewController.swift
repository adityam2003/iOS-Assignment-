//
//  ProductListViewController.swift
//  iOS Assignment
//
//  Created by Aditya Mathur on 31/01/26.
//

import Foundation
import UIKit

class ProductListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Properties
    private let viewModel = ProductListViewModel()
    private let loader = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Products"
        setupTableView()
        setupLoader()
        setupEmptyState()
        bindViewModel()
        viewModel.fetchProducts()
    }

    // MARK: - Setup
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
    }

    private func setupLoader() {
        loader.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loader)

        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func bindViewModel() {

        viewModel.onDataUpdate = { [weak self] in
            guard let self = self else { return }

            let isEmpty = self.viewModel.numberOfItems() == 0

            self.tableView.isHidden = isEmpty
            self.emptyStateLabel.isHidden = !isEmpty

            self.tableView.reloadData()
        }

        viewModel.onLoadingStateChange = { [weak self] isLoading in
            if isLoading {
                self?.loader.startAnimating()
            } else {
                self?.loader.stopAnimating()
            }
        }

        viewModel.onError = { [weak self] _ in
            self?.showErrorScreen()
        }
    }

    // MARK: - Empty State

    private let emptyStateLabel: UILabel = {
        let label = UILabel()
        label.text = "No products available"
        label.textAlignment = .center
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    private func setupEmptyState() {
        view.addSubview(emptyStateLabel)

        emptyStateLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            emptyStateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyStateLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emptyStateLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
            emptyStateLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16)
        ])
    }
    
}


extension ProductListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems()
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ProductCell",
            for: indexPath
        ) as! ProductTableViewCell

        let product = viewModel.product(at: indexPath.row)
        cell.configure(with: product)
        return cell
    }
}

extension ProductListViewController: UITableViewDelegate {

    func tableView(
        _ tableView: UITableView,
        willDisplay cell: UITableViewCell,
        forRowAt indexPath: IndexPath
    ) {
        viewModel.loadNextPageIfNeeded(currentIndex: indexPath.row)
    }

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)

        let product = viewModel.product(at: indexPath.row)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(
            withIdentifier: "ProductDetailViewController"
        ) as! ProductDetailViewController

        detailVC.viewModel = ProductDetailViewModel(product: product)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
   // MARK: - Error handling

    
    private func showErrorScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let errorVC = storyboard.instantiateViewController(
            withIdentifier: "ErrorViewController"
        ) as! ErrorViewController

        errorVC.modalPresentationStyle = .fullScreen

        errorVC.onRetry = { [weak self] in
            self?.viewModel.fetchProducts()
        }

        present(errorVC, animated: true)
    }
}
