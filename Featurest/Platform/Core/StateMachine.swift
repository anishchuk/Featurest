//
//  StateMachine.swift
//  Featurest
//
//  Created by Slava Anishchuk on 30.10.2024.
//

import SwiftUI

protocol StateMachine: ObservableObject {
    associatedtype State
    associatedtype Actions

    var state: State { get }
    func action(_ action: Actions)
}
