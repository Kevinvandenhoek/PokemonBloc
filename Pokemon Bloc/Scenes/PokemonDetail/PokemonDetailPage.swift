//
//  PokemonDetailPage.swift
//  PokemonDetailPage
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import SwiftUI

struct PokemonDetailPage: View {
    
    // MARK: State
    @ObservedObject var bloc: PokemonDetailBloc
    
    private let router: PokemonDetailRouter
    
    // MARK: Lifecycle
    init(router: PokemonDetailRouter, pokemon: Pokemon) {
        self.router = router
        self.bloc = PokemonDetailBloc(pokemon: pokemon)
    }
    
    // MARK: View
    var body: some View {
        SectionView(bloc.state.detailSection) { details in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    PokemonStatsRow(details: details)
                    Divider()
                    PokemonMovesRow(moves: details.moves)
                    Divider()
                    PokemonSpritesRow(sprites: details.sprites)
                        .frame(maxWidth: .infinity)
                }
                .padding(.all, 16)
            }
        }
        .navigationTitle(bloc.state.title)
        .onLoad(perform: { bloc.handle(.initialize) })
    }
}
