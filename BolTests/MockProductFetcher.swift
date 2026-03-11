//
//  MockProductFetcher.swift
//  BolTests
//
//  Created by Fady Yecob on 11/03/2026.
//

import Foundation
@testable import Bol

struct MockProductFetcher: ProductFetching {
    var result: Result<Product, Error>

    func fetchProduct() async throws -> Product {
        try result.get()
    }
}

struct MockError: LocalizedError, Equatable {
    var errorDescription: String? { "mock error" }
}
