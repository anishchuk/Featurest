//
//  FakeStore.Models.swift
//  Featurest
//
//  Created by Slava Anishchuk on 30.10.2024.
//

import Foundation

extension FakeStore.Models {
    struct Product: Decodable {
        let id: Int
        var title: String
        var price: Double
        var category: String
        var description: String
        var image: String
    }
}
