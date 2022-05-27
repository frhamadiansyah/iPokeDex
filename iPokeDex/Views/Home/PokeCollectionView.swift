//
//  PokeCollectionView.swift
//  iPokeDex
//
//  Created by Fandrian Rhamadiansyah on 26/05/22.
//

import SwiftUI

struct PokeCollectionView: View {
    @ObservedObject var vm: HomeViewModel
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(vm.filteredPoke) { poke in
                    NavigationLink {
                        DescriptionView(poke)
                    } label: {
                        PokeCollectionCell(poke: poke)
                    }
                
                }
            }
        }
    }
}

struct PokeCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        PokeCollectionView(vm: HomeViewModel())
    }
}
