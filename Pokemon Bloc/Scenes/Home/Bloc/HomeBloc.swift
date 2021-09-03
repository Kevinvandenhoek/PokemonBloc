//
//  HomeBloc.swift
//  HomeBloc
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Foundation
import SwiftUI

final class HomeBloc: Bloc {
    
    // MARK: State
    @UIPublished var state: State = State(title: "Home")
    
    // MARK: State (private)
    @Injected private var pokemonRepository: PokemonRepository
    
    // MARK: Methods
    func handle(_ event: Event) { Task {
        switch event {
        case .initialize:
            await initialize()
        case .didUpdateFilters(let filters):
            didUpdateFilters(filters)
        }
    } }
}

// MARK: Event Handlers
private extension HomeBloc {
    
    func initialize() async {
        state.pokemonSection = .loading
        switch await pokemonRepository.getAll() {
        case .success(let pokemons):
            state.pokemonSection = .loaded(pokemons)
        case .failure(let error):
            state.pokemonSection = .error(
                title: "woopsie daisy",
                description: "we dun goofed: \(error.localizedDescription)",
                action: ButtonAction(
                    title: "retry",
                    invoke: { [weak self] in self?.handle(.initialize) }
                )
            )
        }
    }
    
    func didUpdateFilters(_ filters: [PokemonFilter]) {
        state.filters = filters
    }
}
