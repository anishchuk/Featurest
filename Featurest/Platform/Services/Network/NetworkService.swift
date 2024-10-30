//
//  NetworkService.swift
//  Featurest
//
//  Created by Slava Anishchuk on 30.10.2024.
//

import Foundation

protocol NetworkService {
    associatedtype Endpoints: URLEndpoint

    func request<T: Decodable>(
        _ method: HTTPMethods,
        endpoint: Endpoints,
        headers: [String: String],
        httpBody: Data?
    ) async throws -> T
}

extension NetworkService {
    func request<T>(
        _ method: HTTPMethods = .get,
        endpoint: Endpoints,
        headers: [String: String] = [:],
        httpBody: Data? = nil
    ) async throws -> T where T: Decodable {
        guard let url = endpoint.url
        else { throw NetworkError.wrongEndpoint }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = httpBody
        request.allHTTPHeaderFields = headers
        
        let (data, _) = try await URLSession.shared.data(for: request)
        guard let object = try? JSONDecoder().decode(T.self, from: data)
        else {
            throw NetworkError.couldNotMapResponse
        }
        
        return object
    }
}
