//
//  AppAssembly.swift
//  AppAssembly
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Foundation

struct AppAssembly {
    
    static func assemble() {
        Dependencies.register(PokemonRepository.self, initializer: PokemonRepositoryService.init)
        Dependencies.register(GetAllPokemon.self, initializer: GetAllPokemonService.init)
        Dependencies.register(GetPokemonById.self, initializer: GetPokemonByIdService.init)
    }
}
