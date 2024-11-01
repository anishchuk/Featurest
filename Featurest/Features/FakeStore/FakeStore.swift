//
//  FakeStore.swift
//  Featurest
//
//  Created by Slava Anishchuk on 30.10.2024.
//

import Foundation

enum FakeStore: Feature {
    enum Models {}
    enum Routes {}
    enum Services {}

    static func start(_ onCompletion: CompletionAction? = nil) -> MainScene {
        return MainScene(
            viewModel: .init(
                service: FakeStore.Services.APIService()
            )
        )
    }
}

extension FakeStore {
    protocol DataProvider {
        func fetchProducts() async throws -> [FakeStore.Models.Product]
    }
}
