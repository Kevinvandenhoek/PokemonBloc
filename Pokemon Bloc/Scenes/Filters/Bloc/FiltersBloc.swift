//
//  FiltersBloc.swift
//  FiltersBloc
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Foundation
import SwiftUI

final class FiltersBloc: Bloc {
    
    // MARK: State
    @UIPublished var state: State = State(title: "Home")
    
    // MARK: State (private)
    @Injected private var pokemonRepository: PokemonRepository
    
    // MARK: Methods
    func handle(_ event: Event) { Task {
        switch event {
        case .initialize:
            await initialize()
        case .didTapFilter(let filter):
            didTapFilter(filter)
        }
    } }
}

// MARK: Event Handlers
private extension FiltersBloc {
    
    func initialize() async {
        state.filters = "abcdefghijklmnopqrstuvwxyz".map({ string in
            return FilterState(filter: .nameContains(String(string)), isEnabled: false)
        })
    }
    
    func didTapFilter(_ filter: PokemonFilter) {
        state.filters = state.filters.map({ filterState in
            guard filterState.filter == filter else { return filterState }
            return FilterState(filter: filter, isEnabled: !filterState.isEnabled)
        })
    }
}
