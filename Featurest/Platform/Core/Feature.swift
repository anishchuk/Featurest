//
//  Feature.swift
//  Featurest
//
//  Created by Slava Anishchuk on 30.10.2024.
//

import SwiftUI

typealias CompletionAction = (() -> Void)

protocol Feature {
    associatedtype MainScene: FeatureScene

    static func start(_ onCompletion: CompletionAction?) -> MainScene
}
