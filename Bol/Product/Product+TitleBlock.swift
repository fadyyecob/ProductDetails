//
//  Product+TitleBlock.swift
//  Bol
//
//  Created by Fady Yecob on 10/03/2026.
//

import Foundation

extension Product {
    struct TitleBlock: Codable {
        let id: String
        let title: String
        let brand: Brand
        let averageRating: AverageRating
        let pricing: Pricing
    }
    
    struct Brand: Codable {
        let id: String
        let label: String
    }

    struct AverageRating: Codable {
        let rating: Double
        let label: String
        let count: Int
    }

    struct Pricing: Codable {
        let bestOffer: BestOffer
        
        struct BestOffer: Codable {
            let price: String
        }
    }
}
