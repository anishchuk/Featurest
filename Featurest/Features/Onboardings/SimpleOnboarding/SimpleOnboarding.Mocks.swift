//
//  SimpleOnboarding.Mocks.swift
//  Featurest
//
//  Created by Slava Anishchuk on 30.10.2024.
//

import Foundation

extension SimpleOnboarding {
    public enum Mocks {
        static var slides: [SimpleOnboarding.Models.Slide] {[
            .init(
                id: 1,
                title: "Welcome to Futurest",
                description: "Futurest is a framework based on Feature-Driven Development",
                imageName: "simpleonboarding.slide1"
            ),
            .init(
                id: 2,
                title: "Title 2",
                description: "Lorem ipsum description 2",
                imageName: "simpleonboarding.slide2"
            ),
            .init(
                id: 3,
                title: "Title 3",
                description: "Lorem ipsum description 3",
                imageName: "simpleonboarding.slide3"
            )
        ]}
    }
}
