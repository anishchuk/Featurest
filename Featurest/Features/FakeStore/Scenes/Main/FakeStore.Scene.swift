//
//  FakeStore.Scene.swift
//  Featurest
//
//  Created by Slava Anishchuk on 30.10.2024.
//

import SwiftUI

extension FakeStore {
    struct MainScene: FeatureScene {
        @StateObject var viewModel: ViewModel
        
        var body: some View {
            VStack {
                Text("Products")
                    .font(.largeTitle)
                List(viewModel.state.products, id: \.id) { product in
                    VStack(spacing: Spacings.standard) {
                        Text(product.title)
                            .textCase(.uppercase)
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .lineLimit(1)
                        
                        Text(product.description)
                            .frame(maxWidth: .infinity)
                            .lineLimit(4)
                    }
                }
                .listStyle(.plain)
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
