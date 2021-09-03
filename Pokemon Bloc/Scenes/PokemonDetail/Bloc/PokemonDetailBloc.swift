//
//  PokemonDetailBloc.swift
//  PokemonDetailBloc
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Foundation
import SwiftUI

final class PokemonDetailBloc: Bloc {
    
    // MARK: State
    @UIPublished var state: State
    
    // MARK: State (private)
    @Injected private var pokemonRepository: PokemonRepository
    
    private let pokemon: Pokemon
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        self.state = State(title: pokemon.name)
    }
    
    // MARK: Methods
    func handle(_ event: Event) { Task {
        switch event {
        case .initialize:
            await initialize()
        }
    } }
}

// MARK: Event Handlers
private extension PokemonDetailBloc {
    
    func initialize() async {
        state.detailSection = .loading
        switch await pokemonRepository.get(id: pokemon.id) {
        case .success(let details):
            state.detailSection = .loaded(details)
        case .failure(let error):
            state.detailSection = .error(
                title: "hurrr",
                description: "sum ting wong: \(error.localizedDescription)",
                action: nil
            )
        }
    }
}
