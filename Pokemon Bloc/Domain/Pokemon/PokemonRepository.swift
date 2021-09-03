//
//  PokemonRepository.swift
//  PokemonRepository
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Foundation

protocol PokemonRepository {
    
    func getAll() async -> Result<[Pokemon], GetAllPokemonError>
    func get(id: String) async -> Result<PokemonDetails, GetPokemonByIdError>
}

struct PokemonRepositoryService: PokemonRepository {
    
    let getAllPokemon: GetAllPokemon
    let getPokemonById: GetPokemonById
    
    func getAll() async -> Result<[Pokemon], GetAllPokemonError> {
        return await getAllPokemon.invoke()
    }
    
    func get(id: String) async -> Result<PokemonDetails, GetPokemonByIdError> {
        return await getPokemonById.invoke(id: id)
    }
}
