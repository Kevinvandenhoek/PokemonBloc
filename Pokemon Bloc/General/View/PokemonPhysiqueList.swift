//
//  PokemonStatsRow.swift
//  PokemonStatsRow
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Foundation
import SwiftUI

struct PokemonStatsRow: View {
    
    let details: PokemonDetails
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .top) {
                Text("Types:")
                    .fontWeight(.bold)
                Text(details.types.map({ $0.capitalized }).joined(separator: ", "))
            }
            HStack(alignment: .top) {
                Text("Height:")
                    .fontWeight(.bold)
                HStack(spacing: 4) {
                    Text("\(details.height)")
                    Text("fietsbellen")
                        .foregroundColor(Color.gray)
                }
            }
            HStack(alignment: .top) {
                Text("Weight:")
                    .fontWeight(.bold)
                HStack(spacing: 4) {
                    Text("\(details.weight)")
                    Text("roze koeken")
                        .foregroundColor(Color.gray)
                }
            }
        }
    }
}
