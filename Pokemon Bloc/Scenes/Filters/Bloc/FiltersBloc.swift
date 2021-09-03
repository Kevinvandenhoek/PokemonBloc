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
    @UIPublished var state: State
    
    // MARK: State (private)
    @Injected private var pokemonRepository: PokemonRepository
    
    private var onUpdate: FilterCallback
    
    init(selected: [PokemonFilter], onUpdate: @escaping FilterCallback) {
        self.onUpdate = onUpdate
        self.state = State(title: "Filters", filters: "abcdefghijklmnopqrstuvwxyz".map({ letter in
            let letter = String(letter)
            return FilterState(filter: .nameContains(letter), isEnabled: selected.contains(where: { filter in
                switch filter {
                case .nameContains(let string):
                    return letter == string
                }
            }))
        }))
    }
    
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
        // Nothing here
    }
    
    func didTapFilter(_ filter: PokemonFilter) {
        state.filters = state.filters.map({ filterState in
            guard filterState.filter == filter else { return filterState }
            return FilterState(filter: filter, isEnabled: !filterState.isEnabled)
        })
        onUpdate(state.filters.filter({ $0.isEnabled }).map({ $0.filter }))
    }
}
