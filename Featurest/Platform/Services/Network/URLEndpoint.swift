//
//  URLEndpoint.swift
//  Featurest
//
//  Created by Slava Anishchuk on 30.10.2024.
//

import Foundation

protocol URLEndpoint {
    static var baseUrl: String { get }
    var url: URL? { get }
    var uri: String { get }
}

extension URLEndpoint {
    var url: URL? {
        return URL(string: Self.baseUrl + self.uri)
    }
}
