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
    
    @Injected var api: API
    
    init() { } // Needed because otherwise auto registration will attempt to inject propertyWrappers
    
    func invoke() async -> Result<[Pokemon], GetAllPokemonError> {
        switch await api.request(GetAllPokemonsAPIRequest()) {
        case .success(let response):
            let pokemons: [Pokemon] = response.results?.compactMap({ entity in
                guard let id = entity.url?.absoluteString.split(separator: "/").last,
                      let name = entity.name?.capitalized else { return nil }
                return Pokemon(id: String(id), name: name)
            }) ?? []
            return .success(pokemons)
        case .failure:
            return .failure(.notFound)
        }
    }
}
