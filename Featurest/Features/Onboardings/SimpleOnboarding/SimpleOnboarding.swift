//
//  SimpleOnboarding.swift
//  Featurest
//
//  Created by Slava Anishchuk on 30.10.2024.
//

import SwiftUI

enum SimpleOnboarding: Feature {
    enum Models { }

    static func start(_ onCompletion: CompletionAction? = nil) -> MainScene {
        return MainScene(
            viewModel: .init(
                state: .init(slides: Mocks.slides),
                onCompletion: onCompletion
            )
        )
    }
}
