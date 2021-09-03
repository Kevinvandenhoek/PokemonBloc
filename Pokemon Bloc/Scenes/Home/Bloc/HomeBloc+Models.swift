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
        var pokemonSection: ViewSection<[Pokemon]> = .initial
    }
    
    enum Event {
        case initialize
        case didTap(Pokemon)
        case didTapFilter
    }
}
