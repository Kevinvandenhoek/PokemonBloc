//
//  PokemonSpritesRow.swift
//  PokemonSpritesRow
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Foundation
import SwiftUI

struct PokemonSpritesRow: View {
    
    let sprites: PokemonDetails.Sprites
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                VStack {
                    Text("Regular")
                        .fontWeight(.bold)
                    URLImage(url: sprites.normal.front)
                    URLImage(url: sprites.normal.back)
                }
                VStack {
                    Text("Shiny")
                        .fontWeight(.bold)
                    URLImage(url: sprites.shiny.front)
                    URLImage(url: sprites.shiny.back)
                }
            }
        }
    }
}
