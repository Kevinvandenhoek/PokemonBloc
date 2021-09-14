//
//  AppCoordinator.swift
//  AppCoordinator
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import SwiftUI

struct AppCoordinator: Coordinator {
    
    var body: some View {
        NavigationView {
            HomePage(router: self)
        }
    }
}

// MARK: HomeRouter
extension AppCoordinator: HomeRouter {
    
    func homeShowPokemon(_ pokemon: Pokemon) -> PokemonDetailPage {
        PokemonDetailPage(router: self, pokemon: pokemon)
    }
    
    func homeShowFilters(selected: [PokemonFilter], onUpdate: @escaping FilterCallback) -> FiltersPage {
        FiltersPage(router: self, selected: selected, onUpdate: onUpdate)
    }
}

// MARK: PokemonDetailRouter
extension AppCoordinator: PokemonDetailRouter {
    
}

// MARK: FiltersRouter
extension AppCoordinator: FiltersRouter {
    
}
