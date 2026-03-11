//
//  ProductDetailsViewModel.swift
//  Bol
//
//  Created by Fady Yecob on 10/03/2026.
//

import SwiftUI

@Observable
class ProductDetailsViewModel {
    private(set) var state: ViewState<Product> = .loading
    private(set) var selectedImageIndex = 0

    private let fetcher: ProductFetching

    init(fetcher: ProductFetching) {
        self.fetcher = fetcher
    }

    var selectedImageURL: URL? {
        guard case .loaded(let product) = state,
              selectedImageIndex < product.media.images.count else {
            return nil
        }
        return URL(string: product.media.images[Int(selectedImageIndex)].url)
    }

    func selectImage(at index: Int) {
        selectedImageIndex = index
    }

    func isImageSelected(at index: Int) -> Bool {
        index == selectedImageIndex
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
}
