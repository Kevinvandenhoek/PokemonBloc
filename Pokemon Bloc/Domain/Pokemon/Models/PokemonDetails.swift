//
//  PokemonDetails.swift
//  PokemonDetails
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Foundation

struct PokemonDetails: Identifiable {
    
    var id: String { pokemon.id }
    let pokemon: Pokemon
}
