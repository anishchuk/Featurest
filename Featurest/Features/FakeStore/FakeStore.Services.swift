//
//  FakeStore.Services.swift
//  Featurest
//
//  Created by Slava Anishchuk on 30.10.2024.
//

extension FakeStore.Services {
    protocol Repository {
        func fetchProducts() async throws -> [FakeStore.Models.Product]
    }
}

extension FakeStore.Services {
    final class APIService: Repository, NetworkService {
        enum Endpoints: URLEndpoint {
            static var baseUrl: String { "https://fakestoreapi.com" }
            
            case products
            
            var uri: String {
                switch self {
                case .products: return "/products"
                }
            }
        }
        
        func fetchProducts() async throws -> [FakeStore.Models.Product] {
            return try await request(endpoint: .products)
        }
    }
}

extension FakeStore.Services {
    final class MockService: Repository {
        func fetchProducts() async throws -> [FakeStore.Models.Product] {
            return [
                .init(
                    id: 1,
                    title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                    price: 200,
                    category: "men's clothing",
                    description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                    image: ""
                ),
                .init(
                    id: 2,
                    title: "Mens Casual Premium Slim Fit T-Shirts",
                    price: 10,
                    category: "men's clothing",
                    description: "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
                    image: ""
                ),
                .init(
                    id: 3,
                    title: "WD 2TB Elements Portable External Hard Drive - USB 3.0",
                    price: 64,
                    category: "electronics",
                    description: "USB 3.0 and USB 2.0 Compatibility Fast data transfers Improve PC Performance High Capacity; Compatibility Formatted NTFS for Windows 10, Windows 8.1, Windows 7; Reformatting may be required for other operating systems; Compatibility may vary depending on user’s hardware configuration and operating system",
                    image: ""
                )
            ]
        }
    }
}
