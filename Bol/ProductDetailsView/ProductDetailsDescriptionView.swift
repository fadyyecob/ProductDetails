//
//  ProductDetailsDescriptionView.swift
//  Bol
//
//  Created by Fady Yecob on 10/03/2026.
//

import SwiftUI

struct ProductDetailsDescriptionView: View {
    let description: Product.Description

    var body: some View {
        VStack(alignment: .leading) {
            Text(description.title)
                .font(.headline)
                .padding(.top, 8)
            Text(description.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(6)
                .padding(.top, 2)
        }
    }
}

#Preview {
    ProductDetailsDescriptionView(
        description: Product.Description(
            title: "Description",
            description: "A sample product description for preview purposes.",
            htmlDescription: ""
        )
    )
}
