//
//  FiltersPage.swift
//  FiltersPage
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import SwiftUI

struct FiltersPage: View {
    
    // MARK: State
    @ObservedObject var bloc: FiltersBloc = FiltersBloc()
    
    private let router: FiltersRouter
    
    // MARK: Lifecycle
    init(router: FiltersRouter) {
        self.router = router
    }
    
    // MARK: View
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                ForEach(bloc.state.filters, id: \.filter.id) { filterState in
                    HStack(spacing: 3) {
                        Text("name must contain: ")
                            .foregroundColor(Color.black.opacity(0.7))
                        Text(filterState.filter.name)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .opacity(filterState.isEnabled ? 1 : 0.6)
                    .padding(.all, 10)
                    .background(Color.black.opacity(filterState.isEnabled ? 0.07 : 0))
                    .cornerRadius(10)
                    .onTapGesture {
                        bloc.handle(.didTapFilter(filterState.filter))
                    }
                }
            }
            .padding(.all, 16)
        }
        .onAppear(perform: { bloc.handle(.initialize) })
    }
}

private extension PokemonFilter {
    
    var id: String {
        return String(describing: self)
    }
    
    var name: String {
        switch self {
        case .nameContains(let string):
            return string
        }
    }
}
