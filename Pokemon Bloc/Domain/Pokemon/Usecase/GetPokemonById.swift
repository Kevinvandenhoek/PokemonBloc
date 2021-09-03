//
//  GetPokemonById.swift
//  GetPokemonById
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Foundation

protocol GetPokemonById {
    
    func invoke(id: String) async -> Result<PokemonDetails, GetPokemonByIdError>
}

enum GetPokemonByIdError: Error {
    case notFound
}

struct GetPokemonByIdService: GetPokemonById {
    
    func invoke(id: String) async -> Result<PokemonDetails, GetPokemonByIdError> {
        return .failure(.notFound)
    }
}
