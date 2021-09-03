//
//  FiltersBloc+Models.swift
//  FiltersBloc+Models
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Foundation

// MARK: Types
extension FiltersBloc {
    
    struct State {
        let title: String
        var filters: [FilterState] = []
    }
    
    struct FilterState {
        let filter: PokemonFilter
        var isEnabled: Bool
    }
    
    enum Event {
        case initialize
        case didTapFilter(PokemonFilter)
    }
}
