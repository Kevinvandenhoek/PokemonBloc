//
//  GetAllPokemon.swift
//  GetAllPokemon
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Foundation

protocol GetAllPokemon {
    
    func invoke() async -> Result<[Pokemon], GetAllPokemonError>
}

enum GetAllPokemonError: Error {
    case notFound
}

struct GetAllPokemonService: GetAllPokemon {
    
    func invoke() async -> Result<[Pokemon], GetAllPokemonError> {
        return .success([])
    }
}
