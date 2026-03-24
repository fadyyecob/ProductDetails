//
//  ProductDetailsView.swift
//  Bol
//
//  Created by Fady Yecob on 10/03/2026.
//

import SwiftUI

struct ProductDetailsView: View {
    @StateObject var viewModel: ProductDetailsViewModel

    var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
                .task {
                    await viewModel.loadProduct()
                }
        case .loaded(let product):
            productContent(product)
        case .error(let error):
            Text(error.localizedDescription)
        }
    }

    private func productContent(_ product: Product) -> some View {
        ScrollView {
            VStack(alignment: .leading) {
                imageView(product.media.images)
                productDescription(product)
                addToBasketButton
                Divider()
                    .padding(.top, 8)
                ProductRecommendationsCarouselView(recommendations: product.recommendations)
                    .padding(.vertical)
            }
        }
    }
    
    private var addToBasketButton: some View {
        Button(action: { viewModel.addToBasket() }) {
            Text(viewModel.addToBasketText)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)
                .foregroundColor(.black)
                .cornerRadius(8)
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
    
    private func imageView(_ images: [Product.Image]) -> some View {
        ProductDetailsImageView(
            imageURLs: images.map(\.url),
            selectedIndex: viewModel.selectedImageIndex,
            onSelectImage: { index in
                viewModel.selectedImageIndex = index
            }
        )
    }
    
    private func productDescription(_ product: Product) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            ProductDetailsTitleBlockView(titleBlock: product.titleBlock)
            Divider()
                .padding(.top, 8)
            ProductDetailsDescriptionView(description: product.description)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProductDetailsView(viewModel: ProductDetailsViewModel(fetcher: LocalProductFetcher()))
}
