//
//  Product+Recommendations.swift
//  Bol
//
//  Created by Fady Yecob on 11/03/2026.
//

import Foundation

extension Product {
    struct Recommendations: Codable {
        let lists: [RecommendationList]
        
        struct RecommendationList: Codable {
            let title: String
            let products: [RecommendedProduct]
            
            struct RecommendedProduct: Codable, Identifiable {
                let id: String
                let title: String
                let imageUrl: String
                let pricing: Pricing
            }
        }
    }
}
