//
//  HomePage.swift
//  HomePage
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import SwiftUI

struct HomePage: View {
    
    @ObservedObject var bloc: HomeBloc = HomeBloc()
    
    var body: some View {
        List {
            Text(bloc.state.title)
            OptionalView(bloc.state.pokemons) { pokemons in
                ForEach(pokemons) { pokemon in
                    Text(pokemon.name)
                }
            }
        }
        .onAppear(perform: { bloc.handle(.initialize) })
    }
}
