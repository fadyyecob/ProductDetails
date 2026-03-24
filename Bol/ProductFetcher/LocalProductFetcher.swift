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
			throw FetchingError()
		}

		let data = try Data(contentsOf: fileURL)
        return try decoder.decode(Product.self, from: data)
	}
}

struct FetchingError: LocalizedError {
    var errorDescription: String? {
        "An error occurred while fetching"
    }
}
