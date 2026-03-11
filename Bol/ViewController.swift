//
//  ViewController.swift
//  Bol
//
//  Created by Fady Yecob on 10/03/2026.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    @IBAction
    private func openProducts() {
        let viewModel = ProductDetailsViewModel(fetcher: LocalMockProductFetcher())
        let detailsView = ProductDetailsView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: detailsView)
        navigationController?.pushViewController(hostingController, animated: true)
    }
}

