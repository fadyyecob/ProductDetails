//
//  Product.swift
//  Bol
//
//  Created by Fady Yecob on 10/03/2026.
//

import Foundation

struct Product: Codable {
    let actionBar: ActionBar
    let media: Media
    let titleBlock: TitleBlock
    let description: Description
    let recommendations: Recommendations
}
