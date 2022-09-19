//
//  Store.swift
//  HolidayApp_SwiftUI
//
//  Created by Dawid Karpiński on 12/09/2022.
//

import Foundation
import Combine

enum Middlewares {}
protocol Action {}
typealias Reducer<State> = (State, Action) -> State
typealias Middleware<State> = (State, Action) -> AnyPublisher<Action, Never>

final class Store<State>: ObservableObject {
    @Published private(set) var state: State
  
     private var subscriptions: [UUID: AnyCancellable] = [:]
  
     private let queue = DispatchQueue(label: "holiday.app", qos: .userInitiated)
     private let reducer: Reducer<State>
     private let middlewares: [Middleware<State>]
  
     init(
         initial state: State,
         reducer: @escaping Reducer<State>,
         middlewares: [Middleware<State>]
     ) {
         self.state = state
         self.reducer = reducer
         self.middlewares = middlewares
     }
    
    func dispatch(_ action: Action) {
        queue.sync {
            self.dispatch(self.state, action)
        }
    }
    
    private func dispatch(_ currentState: State, _ action: Action) {
        let newState = reducer(currentState, action)
        
        middlewares.forEach{ middleware in
            let key = UUID()
            middleware(newState, action)
                .receive(on: RunLoop.main)
                .handleEvents(receiveCompletion: { [weak self] _ in
                    self?.subscriptions.removeValue(forKey: key)
                })
                .sink(receiveValue: dispatch)
                .store(in: &subscriptions, key: key)
        }
        
        state = newState
    }
}

extension AnyCancellable {
    func store(in ditictionary: inout [UUID: AnyCancellable], key: UUID) {
        ditictionary[key] = self
    }
}
