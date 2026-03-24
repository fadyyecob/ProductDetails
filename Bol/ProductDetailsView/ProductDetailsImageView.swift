//
//  ProductDetailsImageView.swift
//  Bol
//
//  Created by Fady Yecob on 10/03/2026.
//

import SwiftUI

struct ProductDetailsImageView: View {
    let imageURLs: [URL]
    var selectedIndex: Int = 0
    let onSelectImage: (Int) -> Void

    var body: some View {
        VStack {
            mainImage
            thumbnailStrip
        }
    }

    @ViewBuilder
    private var mainImage: some View {
        TabView(selection: Binding(
            get: { selectedIndex },
            set: { setSelectedIndex($0) }
        )) {
            ForEach(Array(imageURLs.enumerated()), id: \.offset) { index, url in
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    case .failure:
                        Text("Failed to load image")
                    default:
                        ProgressView()
                    }
                }
                .tag(index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(maxWidth: .infinity)
        .frame(height: 300)
        .padding(.vertical)
    }

    private var thumbnailStrip: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(Array(imageURLs.enumerated()), id: \.offset) { index, url in
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .success(let image):
                            image.resizable().aspectRatio(contentMode: .fit)
                        default:
                            Color.gray.opacity(0.2)
                        }
                    }
                    .frame(width: 56, height: 56)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(
                                index == selectedIndex ? Color.blue : Color.gray.opacity(0.3),
                                lineWidth: index == selectedIndex ? 2 : 1
                            )
                    )
                    .onTapGesture {
                        setSelectedIndex(index)
                    }
                }
            }
            .padding()
        }
    }

    private func setSelectedIndex(_ index: Int) {
        guard index < imageURLs.count else { return }
        onSelectImage(index)
    }
}

#Preview {
    ProductDetailsView(viewModel: ProductDetailsViewModel(fetcher: LocalProductFetcher()))
}
