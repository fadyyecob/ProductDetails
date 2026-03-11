//
//  ProductFetching.swift
//  Bol
//
//  Created by Fady Yecob on 10/03/2026.
//

import Foundation

protocol ProductFetching {
    func fetchProduct() async throws -> Product
}
