//
//  HomeBloc+Models.swift
//  HomeBloc+Models
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

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
