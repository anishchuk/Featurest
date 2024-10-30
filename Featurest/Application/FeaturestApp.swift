//
//  FeaturestApp.swift
//  Featurest
//
//  Created by Slava Anishchuk on 30.10.2024.
//

import SwiftUI

@main
struct FeaturestApp: App {
    @State var onboardingIsShowed: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if !onboardingIsShowed {
                SimpleOnboarding.start() {
                    onboardingIsShowed = true
                }
            } else {
                Text("Empty Scene")
            }
        }
    }
}
