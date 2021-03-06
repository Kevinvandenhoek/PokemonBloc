//
//  HomePage.swift
//  HomePage
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import SwiftUI

struct HomePage: View {
    
    // MARK: State
    @ObservedObject var bloc: HomeBloc = HomeBloc()
    
    private let router: HomeRouter
    
    // MARK: Lifecycle
    init(router: HomeRouter) {
        self.router = router
    }
    
    // MARK: View
    var body: some View {
        SectionView(bloc.state.pokemonSection) { pokemons in
            List {
                ForEach(pokemons.filtered(by: bloc.state.filters)) { pokemon in
                    NavigationLink(pokemon.name) {
                        router.homeShowPokemon(pokemon)
                    }
                }
            }
        }
        .navigationTitle(bloc.state.title)
        .toolbar {
            NavigationLink(bloc.state.filters.isEmpty ? "Filters" : "Filters (\(bloc.state.filters.count))") {
                router.homeShowFilters(selected: bloc.state.filters, onUpdate: { bloc.handle(.didUpdateFilters($0)) })
            }
        }
        .onLoad(perform: { bloc.handle(.initialize) })
    }
}
extension Array where Element == Pokemon {
    
    func filtered(by filters: [PokemonFilter]) -> Self {
        return filter({ pokemon in
            return !filters.map({ filter in
                switch filter {
                case .nameContains(let string):
                    return pokemon.name.lowercased().contains(string.lowercased())
                }
            }).contains(false)
        })
    }
}
