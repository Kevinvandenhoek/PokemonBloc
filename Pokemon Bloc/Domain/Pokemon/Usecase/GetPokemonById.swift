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
    
    @Injected var api: API
    
    init() { } // Needed because otherwise auto registration will attempt to inject propertyWrappers
    
    func invoke(id: String) async -> Result<PokemonDetails, GetPokemonByIdError> {
        switch await api.request(GetPokemonByIdAPIRequest(id: id)) {
        case .success(let response):
            return .success(PokemonDetails(
                pokemon: Pokemon(id: id, name: response.name.capitalized),
                types: response.types.map({ $0.type.name.capitalized }),
                moves: response.moves.map({ $0.move.name.capitalized }),
                height: response.height,
                weight: response.weight,
                sprites: PokemonDetails.Sprites(
                    normal: PokemonDetails.SpriteSet(
                        front: URL(string: response.sprites.frontDefault)!,
                        back: URL(string: response.sprites.backDefault)!
                    ),
                    shiny: PokemonDetails.SpriteSet(
                        front: URL(string: response.sprites.frontShiny)!,
                        back: URL(string: response.sprites.backShiny)!
                    )
                )
            ))
        case .failure:
            return .failure(.notFound)
        }
    }
}
