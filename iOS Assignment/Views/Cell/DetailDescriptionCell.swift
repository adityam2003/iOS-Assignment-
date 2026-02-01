//
//  DetailDescriptionCell.swift
//  iOS Assignment
//
//  Created by Aditya Mathur on 01/02/26.
//

import Foundation
import UIKit


final class DetailDescriptionCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(with viewModel: ProductDetailViewModel) {
        backgroundColor = .secondarySystemBackground
        descriptionLabel.text = "ℹ \(viewModel.description)"
    }
}
