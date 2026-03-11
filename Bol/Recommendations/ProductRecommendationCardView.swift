//
//  ProductRecommendationCardView.swift
//  Bol
//
//  Created by Fady Yecob on 11/03/2026.
//

import SwiftUI

struct ProductRecommendationCardView: View {
    let product: Product.Recommendations.RecommendationList.RecommendedProduct

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            AsyncImage(url: URL(string: product.imageUrl)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                case .failure:
                    Color.gray.opacity(0.2)
                default:
                    ProgressView()
                }
            }
            .frame(width: 120, height: 120)

            Text(product.title)
                .font(.caption)
                .lineLimit(2)

            Text(product.pricing.bestOffer.price)
                .font(.subheadline)
                .fontWeight(.bold)
        }
        .frame(width: 120)
    }
}

#Preview {
    ProductRecommendationCardView(
        product: .init(
            id: "1",
            title: "Nintendo Switch OLED - Wit",
            imageUrl: "https://media.s-bol.com/77G3GrlZMLEA/N38qYN/168x165.jpg",
            pricing: .init(bestOffer: .init(price: "334,-"))
        )
    )
}
