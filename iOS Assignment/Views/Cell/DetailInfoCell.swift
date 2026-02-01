//
//  DetailInfoCell.swift
//  iOS Assignment
//
//  Created by Aditya Mathur on 01/02/26.
//

import Foundation
import UIKit

final class DetailInfoCell: UITableViewCell {
    
    
    @IBOutlet weak var brandLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var stockLabel: UILabel!
    
    func configure(with viewModel: ProductDetailViewModel) {
        priceLabel.text = viewModel.priceText
        ratingLabel.text = viewModel.ratingText
        brandLabel.text = "Brand: \(viewModel.brand)"
        categoryLabel.text = "Category: \(viewModel.category)"
        stockLabel.text = "\(viewModel.stockText)"
    }
    
}
