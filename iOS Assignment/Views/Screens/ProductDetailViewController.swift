//
//  ProductDetailViewController.swift
//  iOS Assignment
//
//  Created by Aditya Mathur on 01/02/26.
//

import Foundation
import UIKit

final class ProductDetailViewController: UITableViewController {

    var viewModel: ProductDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = viewModel.title
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 1
    }
    
    override func tableView(
            _ tableView: UITableView,
            cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        switch indexPath.section {
            
        case 0:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ImageCell",
                for: indexPath
            ) as! DetailImageCell
            cell.configure(with: viewModel)
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "InfoCell",
                for: indexPath
            ) as! DetailInfoCell
            cell.configure(with: viewModel)
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "DescriptionCell",
                for: indexPath
            ) as! DetailDescriptionCell
            cell.configure(with: viewModel)
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "SpecsCell",
                for: indexPath
            ) as! DetailSpecsCell
            cell.configure(with: viewModel)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
}
