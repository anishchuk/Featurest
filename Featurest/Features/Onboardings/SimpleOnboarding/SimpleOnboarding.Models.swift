//
//  SimpleOnboarding.Models.swift
//  Featurest
//
//  Created by Slava Anishchuk on 30.10.2024.
//

import Foundation

extension SimpleOnboarding.Models {
    struct Slide {
        let id: Int
        let title: String
        let description: String
        let imageName: String
    }
}

extension SimpleOnboarding.Models.Slide: SimpleOnboarding.MainScene.SlideView.ViewData {}
