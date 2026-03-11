//
//  ProductDetailsView.swift
//  Bol
//
//  Created by Fady Yecob on 10/03/2026.
//

import SwiftUI

struct ProductDetailsView: View {
    @State var viewModel: ProductDetailsViewModel

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
            }
        }
    }
    
    private func imageView(_ images: [Product.Image]) -> some View {
        ProductDetailsImageView(
            imageURLs: images.compactMap {
                URL(string: $0.url)
            },
            selectedIndex: viewModel.selectedImageIndex,
            onSelectImage: {
                viewModel.selectImage(at: $0)
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
    ProductDetailsView(viewModel: ProductDetailsViewModel(fetcher: LocalMockProductFetcher()))
}
