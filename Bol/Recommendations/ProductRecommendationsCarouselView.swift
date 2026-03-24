//
//  ProductRecommendationsCarouselView.swift
//  Bol
//
//  Created by Fady Yecob on 11/03/2026.
//

import SwiftUI

struct ProductRecommendationsCarouselView: View {
    let recommendations: Product.Recommendations

    var body: some View {
        ForEach(recommendations.lists, id: \.title) { list in
            VStack(alignment: .leading, spacing: 12) {
                Text(list.title)
                    .font(.headline)
                    .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 12) {
                        ForEach(list.products) { product in
                            ProductRecommendationCardView(product: product)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    ProductRecommendationsCarouselView(
        recommendations: Product.Recommendations(lists: [
            .init(
                title: "Anderen bekeken ook",
                products: [
                    .init(
                        id: "1",
                        title: "Nintendo Switch OLED - Wit",
                        imageUrl: URL(string:  "https://media.s-bol.com/77G3GrlZMLEA/N38qYN/168x165.jpg")!,
                        pricing: .init(bestOffer: .init(price: "334,-"))
                    )
                ]
            )
        ])
    )
}
