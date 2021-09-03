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
    let types: [String]
    let moves: [String]
    let height: Int
    let weight: Int
    let sprites: Sprites
    
    struct Sprites {
        let normal: SpriteSet
        let shiny: SpriteSet
    }
    
    struct SpriteSet {
        let front: URL
        let back: URL
    }
}
