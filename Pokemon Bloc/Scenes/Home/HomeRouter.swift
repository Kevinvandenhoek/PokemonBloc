//
//  HomeRouter.swift
//  HomeRouter
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import SwiftUI

protocol HomeRouter {
    
    func homeShowPokemon(_ pokemon: Pokemon) -> AnyView
    func homeShowFilters(selected: [PokemonFilter], onUpdate: @escaping FilterCallback) -> AnyView
}

typealias FilterCallback = ([PokemonFilter]) -> Void
