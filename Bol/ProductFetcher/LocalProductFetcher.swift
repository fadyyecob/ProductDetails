//
//  LocalProductFetcher.swift
//  Bol
//
//  Created by Fady Yecob on 10/03/2026.
//

import Foundation

struct LocalProductFetcher: ProductFetching {
    private let decoder = JSONDecoder()
    
	func fetchProduct() throws -> Product {
		guard let fileURL = Bundle.main.url(
			forResource: "product",
			withExtension: "json"
		) else {
			throw NetworkError()
		}

		let data = try Data(contentsOf: fileURL)
        return try decoder.decode(Product.self, from: data)
	}
}

struct NetworkError: LocalizedError {
    var errorDescription: String? {
        "A network error occured"
    }
}
