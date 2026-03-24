//
//  Product+Pricing.swift
//  Bol
//
//  Created by Fady Yecob on 24/03/2026.
//

import Foundation

extension Product {
    struct Pricing: Codable {
        let bestOffer: BestOffer
        
        struct BestOffer: Codable {
            let price: String
        }
    }
}
