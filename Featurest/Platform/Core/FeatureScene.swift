//
//  FeatureScene.swift
//  Featurest
//
//  Created by Slava Anishchuk on 30.10.2024.
//

import SwiftUI

protocol FeatureScene: View {
    associatedtype ViewModel: StateMachine
    var viewModel: ViewModel { get }
}
