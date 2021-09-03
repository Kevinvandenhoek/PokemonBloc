//
//  GetPokemonByIdAPIRequest.swift
//  GetPokemonByIdAPIRequest
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Foundation

struct GetPokemonByIdAPIRequest: APIRequest {
    
    var backend: Backend { .pokeApi }
    var path: String { "pokemon/\(id)" }
    var parameters: [String : Encodable] { [:] }
    
    let id: String
}

extension GetPokemonByIdAPIRequest {
    
    struct Response: Codable {
        let abilities: [Ability]
        let height: Int
        let id: Int
        let moves: [Move]
        let name: String
        let order: Int
        let species: Reference
        let sprites: Sprites
        let types: [TypeElement]
        let weight: Int
    }
    
    class Sprites: Codable {
        let backDefault: String
        let backShiny: String
        let frontDefault: String
        let frontShiny: String

        enum CodingKeys: String, CodingKey {
            case backDefault = "back_default"
            case backShiny = "back_shiny"
            case frontDefault = "front_default"
            case frontShiny = "front_shiny"
        }
    }
    
    struct Ability: Codable {
        let ability: Reference
    }
    
    struct Reference: Codable {
        let name: String
        let url: String
    }
    
    struct Move: Codable {
        let move: Reference
    }
    
    struct TypeElement: Codable {
        let type: Reference
    }
}
