//
//  ProductCard.swift
//  Featurest
//
//  Created by Slava Anishchuk on 30.10.2024.
//

import SwiftUI

struct ProductCard: View {
    let data: DataView

    var body: some View {
        VStack(spacing: Spacings.standard) {
            CacheAsyncImage(url: data.imageUrl) { content in
                if let image = content.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else {
                    Color.gray
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 180)
            .clipShape(.rect(cornerRadius: Radiuses.cardview))
            
            VStack(alignment: .leading, spacing: Spacings.standard) {
                Text(data.title)
                    .lineLimit(2)
                
                Text("$ \(data.price)")
                    .fontWeight(.bold)
                    .lineLimit(1)
            }
            .padding(.top, Spacings.standard)
        }
        .padding(Spacings.halfOfStandard)
    }
}

extension ProductCard {
    protocol DataView {
        var title: String { get }
        var price: Double { get }
        var imageUrl: URL? { get }
    }
}

#Preview {
    ProductCard(
        data: FakeStore.Models.Product(
            id: 0,
            title: "Mocked ProductBox - Mocked ProductBox - Mocked ProductBox",
            price: 200,
            category: "Mocks",
            description: "",
            image: "https://img.freepik.com/premium-psd/packaging-box-mockup_68185-773.jpg"
        )
    )
}
