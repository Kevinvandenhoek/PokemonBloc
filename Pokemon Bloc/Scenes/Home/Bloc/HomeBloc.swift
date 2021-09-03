//
//  HomeBloc.swift
//  HomeBloc
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Foundation
import SwiftUI

final class HomeBloc: Bloc {
    
    // MARK: Internal properties
    @UIPublished var state: State = State(title: "Home", pokemons: nil)
    
    // MARK: Private properties
    @Injected private var pokemonRepository: PokemonRepository
    
    // MARK: Methods
    func handle(_ event: Event) { Task {
        switch event {
        case .initialize:
            await initialize()
        case .didTap(let pokemon):
            didTap(pokemon)
        case .didTapFilter:
            didTapFilter()
        }
    } }
}

// MARK: Event Handlers
private extension HomeBloc {
    
    func initialize() async {
        switch await pokemonRepository.getAll() {
        case .success(let pokemons):
            state.pokemons = pokemons
        case .failure(let error):
            state.title = "whoopsie daisy, \(error.localizedDescription)"
        }
    }
    
    func didTap(_ pokemon: Pokemon) {
        print(#function)
    }
    
    func didTapFilter() {
        print(#function)
    }
}
