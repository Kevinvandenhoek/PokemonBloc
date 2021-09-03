//
//  HomeBloc.swift
//  HomeBloc
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Foundation
import SwiftUI

final class HomeBloc: Bloc, ObservableObject {
    
    // MARK: Properties
    @Published var state: State
    
    @Injected private var pokemonRepository: PokemonRepository
    
    // MARK: Lifecycle
    init() {
        state = State(title: "Home", pokemons: nil)
    }
    
    // MARK: Methods
    func handle(_ event: Event) {
        switch event {
        case .initialize:
            initialize()
        case .didTap(let pokemon):
            didTap(pokemon)
        case .didTapFilter:
            didTapFilter()
        }
    }
}

// MARK: Event Handlers
private extension HomeBloc {
    
    func initialize() {
        state.pokemons = [Pokemon(id: "69", name: "Arie")]
    }
    
    func didTap(_ pokemon: Pokemon) {
        print(#function)
    }
    
    func didTapFilter() {
        print(#function)
    }
}

// MARK: Types
extension HomeBloc {
    
    struct State {
        var title: String
        var pokemons: [Pokemon]?
    }
    
    enum Event {
        case initialize
        case didTap(Pokemon)
        case didTapFilter
    }
}
