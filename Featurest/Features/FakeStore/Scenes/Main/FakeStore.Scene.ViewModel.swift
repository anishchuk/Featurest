//
//  FakeStore.Scene.ViewModel.swift
//  Featurest
//
//  Created by Slava Anishchuk on 30.10.2024.
//

import Foundation

extension FakeStore.MainScene {
    final class ViewModel: StateMachine {
        enum Actions {
            case fetchProducts
        }
        
        struct State {
            var products: [FakeStore.Models.Product] = []
        }
        
        @Published var state: State
        let service: FakeStore.DataProvider

        init(
            state: State = .init(),
            service: FakeStore.DataProvider
        ) {
            self.state = state
            self.service = service
        }
        
        func action(_ action: Actions) {
            switch action {
            case .fetchProducts:
                Task {
                    if let products = try? await service.fetchProducts() {
                        await updateProducts(products)
                    }
                }
            }
        }
    }
}

extension FakeStore.MainScene.ViewModel {
    @MainActor
    func updateProducts(_ products: [FakeStore.Models.Product]) {
        state.products = products
    }
}
