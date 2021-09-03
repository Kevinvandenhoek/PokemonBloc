//
//  HomeRouter.swift
//  HomeRouter
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import SwiftUI

struct HomeRouter {
    
    var onDidSelectPokemon: (Pokemon) -> AnyView
    var onDidTapFilters: (FilterCallback) -> AnyView
}

typealias FilterCallback = ([PokemonFilter]) -> Void

enum PokemonFilter: Equatable {
    case nameContains(String)
}
