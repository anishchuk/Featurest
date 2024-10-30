//
//  SimpleOnboarding.Screen.swift
//  Featurest
//
//  Created by Slava Anishchuk on 30.10.2024.
//

import SwiftUI

extension SimpleOnboarding {
    struct Scene: FeatureScene {
        @StateObject var viewModel: ViewModel
        
        var body: some View {
            VStack {
                TabView(selection: $viewModel.state.currentSlide) {
                    ForEach(viewModel.state.slides, id: \.id) { slide in
                        SlideView(data: slide)
                    }
                }
                .tabViewStyle(.page)
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            Button(
                action: { viewModel.action(.nextSlide) },
                label: {
                    Text(viewModel.state.buttonTitle)
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundStyle(.white)
                }
            )
            .frame(width: 160, height: 44)
            .background(viewModel.state.buttonBackground)
            .cornerRadius(Radiuses.buttonCornerRadius)
        }
    }
}

#Preview {
    SimpleOnboarding.Scene(
        viewModel: .init(
            state: .init(slides: SimpleOnboarding.Mocks.slides)
        )
    )
}
