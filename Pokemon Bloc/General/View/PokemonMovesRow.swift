//
//  PokemonMovesRow.swift
//  PokemonMovesRow
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Foundation
import SwiftUI

struct PokemonMovesRow: View {
    
    let moves: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Moves:")
                .fontWeight(.bold)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 10) {
                    ForEach(moves) { move in
                        Text(move)
                            .padding(10)
                            .background(Color(red: 0, green: 0, blue: 0, opacity: 0.07))
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}
