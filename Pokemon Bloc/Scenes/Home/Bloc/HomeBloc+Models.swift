//
//  HomeBloc+Models.swift
//  HomeBloc+Models
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

// MARK: Types
extension HomeBloc {
    
    struct State {
        let title: String
        var filters: [PokemonFilter] = []
        var pokemonSection: ViewSection<[Pokemon]> = .initial
    }
    
    enum Event {
        case initialize
        case didUpdateFilters([PokemonFilter])
        case didTapClearFilters
    }
}
