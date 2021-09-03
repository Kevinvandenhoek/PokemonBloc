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
        contentView
            .navigationTitle(bloc.state.title)
            .onAppear(perform: { bloc.handle(.initialize) })
    }
}

// MARK: View Builders
private extension PokemonDetailPage {
    
    @ViewBuilder var contentView: some View {
        switch bloc.state.detailSection {
        case .initial:
            Color.clear
        case .loading:
            ProgressView()
        case .error(let title, let description, let action):
            VStack {
                Text(title)
                Text(description)
                OptionalView(action) { action in
                    Button(action.title, action: action.invoke)
                }
            }
        case .loaded(let pokemon):
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(alignment: .top) {
                            Text("Types:")
                                .fontWeight(.bold)
                            Text(pokemon.types.map({ $0.capitalized }).joined(separator: ", "))
                        }
                        HStack(alignment: .top) {
                            Text("Height:")
                                .fontWeight(.bold)
                            HStack(spacing: 4) {
                                Text("\(pokemon.height)")
                                Text("fietsbellen")
                                    .foregroundColor(Color.gray)
                            }
                        }
                        HStack(alignment: .top) {
                            Text("Weight:")
                                .fontWeight(.bold)
                            HStack(spacing: 4) {
                                Text("\(pokemon.weight)")
                                Text("roze koeken")
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                    Divider()
                    VStack(alignment: .leading) {
                        Text("Moves:")
                            .fontWeight(.bold)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .center, spacing: 10) {
                                ForEach(pokemon.moves) { move in
                                    Text(move)
                                        .padding(10)
                                        .background(Color(red: 0, green: 0, blue: 0, opacity: 0.07))
                                        .cornerRadius(10)
                                }
                            }
                        }
                    }
                    Divider()
                    Spacer()
                    VStack(alignment: .center) {
                        HStack {
                            VStack {
                                Text("Regular")
                                    .fontWeight(.bold)
                                URLImage(url: pokemon.sprites.normal.front)
                                URLImage(url: pokemon.sprites.normal.back)
                            }
                            VStack {
                                Text("Shiny")
                                    .fontWeight(.bold)
                                URLImage(url: pokemon.sprites.shiny.front)
                                URLImage(url: pokemon.sprites.shiny.back)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    Spacer()
                }
                .padding(.all, 16)
            }
        }
    }
}
