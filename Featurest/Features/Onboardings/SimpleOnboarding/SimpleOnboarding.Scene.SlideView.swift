//
//  SimpleOnboarding.Scene.SlideView.swift
//  Featurest
//
//  Created by Slava Anishchuk on 30.10.2024.
//

import SwiftUI

extension SimpleOnboarding.MainScene {
    struct SlideView: View {
        let data: ViewData
        
        var body: some View {
            VStack(spacing: Spacings.standard) {
                Image(data.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 320, height: 320)
                Text(data.title)
                    .font(.largeTitle)
                Text(data.description)
                    .padding(Spacings.standard)
            }
        }
    }
}

extension SimpleOnboarding.MainScene.SlideView {
    protocol ViewData {
        var id: Int { get }
        var title: String { get }
        var description: String { get }
        var imageName: String { get }
    }
}

#Preview {
    SimpleOnboarding.MainScene.SlideView(
        data: SimpleOnboarding.Mocks.slides[0]
    )
}
