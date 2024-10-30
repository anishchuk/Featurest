//
//  Completable.swift
//  Featurest
//
//  Created by Slava Anishchuk on 30.10.2024.
//

import Foundation

protocol Completable {
    var onCompletion: CompletionAction? { get }
}
