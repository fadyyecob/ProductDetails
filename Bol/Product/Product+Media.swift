//
//  Product+Media.swift
//  Bol
//
//  Created by Fady Yecob on 10/03/2026.
//

import Foundation

extension Product {
    struct Media: Codable {
        let promotions: [Promotion]
        let images: [Image]
    }
    
    struct Promotion: Codable {
        let type: String
        let label: String
        let details: PromotionDetails
        
        struct PromotionDetails: Codable {
            let title: String
            let text: String
            let link: Link
            
            struct Link: Codable {
                let text: String
                let url: String
            }
        }
    }
    
    struct Image: Codable {
        let url: String
    }
}
