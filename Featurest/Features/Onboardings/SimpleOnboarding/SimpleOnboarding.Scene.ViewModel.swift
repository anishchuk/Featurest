//
//  SimpleOnboarding.Scene.ViewModel.swift
//  Featurest
//
//  Created by Slava Anishchuk on 30.10.2024.
//

import SwiftUI

extension SimpleOnboarding.Scene {
    final class ViewModel: StateMachine, Completable {
        enum Actions {
            case prevSlide
            case nextSlide
            case completion
        }
        
        struct State {
            var currentSlide: Int
            let slides: [SimpleOnboarding.Models.Slide]
            
            var isLastSlide: Bool {
                currentSlide == slides.count
            }
            
            var buttonTitle: String {
                isLastSlide ? "Get Started" : "Next"
            }
            
            var buttonBackground: Color {
                isLastSlide ? .orange : .blue
            }
            
            init(currentSlide: Int = 1, slides: [SimpleOnboarding.Models.Slide]) {
                self.slides = slides
                self.currentSlide = currentSlide
            }
        }
        
        @Published var state: State
        private(set) var onCompletion: CompletionAction?

        init(state: State, onCompletion: CompletionAction? = nil) {
            self.state = state
            self.onCompletion = onCompletion
        }
        
        func action(_ action: Actions) {
            switch action {
            case .nextSlide:
                if state.currentSlide < state.slides.count {
                    state.currentSlide += 1
                } else {
                    self.action(.completion)
                }
            case .prevSlide:
                if state.currentSlide > 0 {
                    state.currentSlide -= 1
                }
            case .completion:
                onCompletion?()
            }
        }
    }
}
