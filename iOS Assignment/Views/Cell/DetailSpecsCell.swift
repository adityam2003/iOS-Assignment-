//
//  DetailSpecsCell.swift
//  iOS Assignment
//
//  Created by Aditya Mathur on 01/02/26.
//

import Foundation
import UIKit

final class DetailSpecsCell: UITableViewCell {
    
    @IBOutlet weak var colorLabel: UILabel!
    
    @IBOutlet weak var specs1Label: UILabel!
    
    @IBOutlet weak var specs2Label: UILabel!
    
    func configure(with viewModel: ProductDetailViewModel) {
        let array: [String] = viewModel.specsSummary
        colorLabel.text = array[0]
        specs1Label.text = array[1]
        specs2Label.text = array[2]
        
    }
    
}
