//
//  ErrorViewController.swift
//  iOS Assignment
//
//  Created by Aditya Mathur on 01/02/26.
//

import Foundation
import UIKit

final class ErrorViewController: UIViewController {

    var onRetry: (() -> Void)?

    @IBAction func retryTapped(_ sender: UIButton) {
        dismiss(animated: true) {
            self.onRetry?()
        }
    }
}
