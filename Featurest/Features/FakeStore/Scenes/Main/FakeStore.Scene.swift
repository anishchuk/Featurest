//
//  FakeStore.Scene.swift
//  Featurest
//
//  Created by Slava Anishchuk on 30.10.2024.
//

import SwiftUI

extension FakeStore.Models.Product: ProductCard.DataView { }

extension FakeStore {
    struct MainScene: FeatureScene {
        @StateObject var viewModel: ViewModel
        private let gridItemsLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
        
        var body: some View {
            VStack {
                Text("Products")
                    .font(.largeTitle)
                ScrollView {
                    LazyVGrid(columns: gridItemsLayout, spacing: Spacings.standard) {
                        ForEach(viewModel.state.products, id: \.id) { product in
                            ProductCard(data: product)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.action(.fetchProducts)
            }
        }
    }
}

#Preview {
    FakeStore.MainScene(
        viewModel: .init(
            service: FakeStore.Services.MockService()
        )
    )
}
