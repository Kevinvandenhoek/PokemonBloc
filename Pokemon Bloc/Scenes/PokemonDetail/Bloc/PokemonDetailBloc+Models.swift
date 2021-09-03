//
//  PokemonDetailBloc+Models.swift
//  PokemonDetailBloc+Models
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

extension PokemonDetailBloc {
    
    struct State {
        let title: String
        var detailSection: ViewSection<PokemonDetails> = .initial
    }
    
    enum Event {
        case initialize
    }
}
