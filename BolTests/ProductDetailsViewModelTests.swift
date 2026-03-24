//
//  ProductDetailsViewModelTests.swift
//  BolTests
//
//  Created by Fady Yecob on 11/03/2026.
//

import Foundation
import Testing
@testable import Bol

struct ProductDetailsViewModelTests {

    // MARK: - addToBasketText

    @MainActor @Test
    func addToBasketText_whenBasketIsEmpty_returnsAddToBasket() {
        let sut = ProductDetailsViewModel(fetcher: MockProductFetcher(result: .success(makeProduct())))
        #expect(sut.addToBasketText == "Add to basket")
    }

    @MainActor @Test
    func addToBasketText_afterAddingItems_includesCount() {
        let sut = ProductDetailsViewModel(fetcher: MockProductFetcher(result: .success(makeProduct())))
        sut.addToBasket()
        #expect(sut.addToBasketText == "Add to basket (1)")
        sut.addToBasket()
        #expect(sut.addToBasketText == "Add to basket (2)")
    }

    // MARK: - loadProduct

    @MainActor @Test
    func loadProduct_onSuccess_setsLoadedState() async {
        let product = makeProduct()
        let sut = ProductDetailsViewModel(fetcher: MockProductFetcher(result: .success(product)))
        await sut.loadProduct()
        guard case .loaded(let loaded) = sut.state else {
            Issue.record("Expected loaded state")
            return
        }
        #expect(loaded.titleBlock.title == product.titleBlock.title)
    }

    @MainActor @Test
    func loadProduct_onFailure_setsErrorState() async {
        let sut = ProductDetailsViewModel(fetcher: MockProductFetcher(result: .failure(MockError())))
        await sut.loadProduct()
        guard case .error = sut.state else {
            Issue.record("Expected error state")
            return
        }
    }
}

private func makeProduct(
    imageURLs: [URL] = [
        URL(string: "https://example.com/img0.jpg")!,
        URL(string: "https://example.com/img1.jpg")!
    ]
) -> Product {
    Product(
        actionBar: .init(socialUrl: URL(string: "bol.com")!, socialShareText: ""),
        media: .init(
            promotions: [],
            images: imageURLs.map { .init(url: $0) }
        ),
        titleBlock: .init(
            id: "1",
            title: "Test Product",
            brand: .init(id: "b1", label: "Brand"),
            averageRating: .init(rating: 4.5, label: "4.5", count: 100),
            pricing: .init(bestOffer: .init(price: "9.99"))
        ),
        description: .init(title: "Desc", description: "A product", htmlDescription: "<p>A product</p>"),
        recommendations: .init(lists: [])
    )
}
