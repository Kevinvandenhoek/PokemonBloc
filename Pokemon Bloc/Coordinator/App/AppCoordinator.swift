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
            HomePage(
                router: HomeRouter(
                    onDidSelectPokemon: onDidSelect,
                    onDidTapFilters: onDidTapFilters
                )
            )
        }
    }
}

// MARK: Home Routes
extension AppCoordinator {
    
    func onDidSelect(_ pokemon: Pokemon) -> AnyView {
        return AnyView(PokemonDetailPage(router: PokemonDetailRouter(), pokemon: pokemon))
    }
    
    func onDidTapFilters(_ filters: [PokemonFilter], _ onUpdate: @escaping FilterCallback) -> AnyView {
        return AnyView(FiltersPage(router: FiltersRouter(), filters: filters, onUpdate: onUpdate))
    }
}
