//
//  Product+Description.swift
//  Bol
//
//  Created by Fady Yecob on 10/03/2026.
//

import Foundation

extension Product {
    struct Description: Codable {
        let title: String
        let description: String
        let htmlDescription: String
    }
}
