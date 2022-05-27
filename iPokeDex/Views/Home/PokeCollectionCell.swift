//
//  PokeCollectionCell.swift
//  iPokeDex
//
//  Created by Fandrian Rhamadiansyah on 26/05/22.
//

import SwiftUI

struct PokeCollectionCell: View {
    let poke: Pokemon
    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: URL(string: poke.spriteUrl)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .padding(10)
            
            Text("#\(poke.pokemonId) \(poke.name.capitalized)")
                .pokeWhiteText(.subheadline)
        }
        .background(content: {
            RoundedRectangle(cornerRadius: 16)
                .fill(.background)
                .shadow(color: Color.secondary, radius: 5)
        })
        .padding()
        
    }
}

struct PokeCollectionCell_Previews: PreviewProvider {
    static var previews: some View {
        PokeCollectionCell(poke: Pokemon())
    }
}
