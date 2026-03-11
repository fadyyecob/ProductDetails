//
//  ProductDetailsTitleBlockView.swift
//  Bol
//
//  Created by Fady Yecob on 10/03/2026.
//

import SwiftUI

struct ProductDetailsTitleBlockView: View {
    let titleBlock: Product.TitleBlock

    var body: some View {
        VStack(alignment: .leading) {
            priceView
            brandView
            titleView
            ratingView
        }
    }
    
    private var priceView: some View {
        Text(titleBlock.pricing.bestOffer.price)
            .font(.title)
            .fontWeight(.bold)
            .padding(.top)
    }
    
    private var brandView: some View {
        HStack {
            Text(titleBlock.brand.label)
                .foregroundStyle(.link)
                .font(.subheadline)
            Image(systemName: "chevron.right")
                .font(.caption2)
                .foregroundStyle(.link)
        }
    }
    
    private var titleView: some View {
        Text(titleBlock.title)
            .font(.title2)
            .fontWeight(.bold)
    }

    private var ratingView: some View {
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .foregroundStyle(.yellow)
                .font(.caption)
            Text(titleBlock.averageRating.label)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ProductDetailsView(viewModel: ProductDetailsViewModel(fetcher: LocalMockProductFetcher()))
}
