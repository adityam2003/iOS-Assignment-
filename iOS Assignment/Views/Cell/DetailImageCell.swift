//
//  DetailImageCell.swift
//  iOS Assignment
//
//  Created by Aditya Mathur on 01/02/26.
//

import Foundation
import UIKit

final class DetailImageCell: UITableViewCell {
    
 
    
    @IBOutlet weak var productImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .secondarySystemBackground
    }

    func configure(with viewModel: ProductDetailViewModel) {
        ImageLoader.shared.loadImage(
            from: viewModel.imageURL?.absoluteString ?? "",
            into: productImageView
        )
    }
}
