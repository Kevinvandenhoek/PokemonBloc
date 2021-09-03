//
//  AppAssembly.swift
//  AppAssembly
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Foundation

struct AppAssembly {
    
    static func assemble() {
        Dependencies.register(API.self, APIService.init)
        Dependencies.register(PokemonRepository.self, PokemonRepositoryService.init)
        Dependencies.register(GetAllPokemon.self, GetAllPokemonService.init)
        Dependencies.register(GetPokemonById.self, GetPokemonByIdService.init)
        Dependencies.register(JSONDecoder.self, JSONDecoder.init)
        Dependencies.register(JSONEncoder.self, JSONEncoder.init)
    }
}
