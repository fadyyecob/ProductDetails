//
//  ProductDetailsViewModel.swift
//  Bol
//
//  Created by Fady Yecob on 10/03/2026.
//

import Combine
import SwiftUI

@MainActor
class ProductDetailsViewModel: ObservableObject {
    @Published private(set) var state: ViewState<Product> = .loading
    @Published var selectedImageIndex = 0
    @Published private(set) var basketCount = 0

    private let fetcher: ProductFetching
    
    var addToBasketText: String {
        guard basketCount > 0 else {
            return "Add to basket"
        }
        return "Add to basket (\(basketCount))"
    }

    init(fetcher: ProductFetching) {
        self.fetcher = fetcher
    }

    func loadProduct() async {
        state = .loading
        do {
            let product = try await fetcher.fetchProduct()
            state = .loaded(product)
        } catch {
            state = .error(error)
        }
    }
    
    func addToBasket() {
        basketCount += 1
    }
}
