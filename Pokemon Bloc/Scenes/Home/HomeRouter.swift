//
//  HomeRouter.swift
//  HomeRouter
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import SwiftUI

protocol HomeRouter {
    
    func homeShowPokemon(_ pokemon: Pokemon) -> PokemonDetailPage
    func homeShowFilters(selected: [PokemonFilter], onUpdate: @escaping FilterCallback) -> FiltersPage
}

typealias FilterCallback = ([PokemonFilter]) -> Void
