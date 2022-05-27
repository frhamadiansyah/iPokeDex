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
            if !vm.filteredPoke.isEmpty {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(vm.filteredPoke) { poke in
                        NavigationLink {
                            DescriptionView(poke)
                        } label: {
                            PokeCollectionCell(poke: poke)
                        }
                        
                    }
                    
                }
            } else {
                Text("No Pokemon Found")
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

struct PokeCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        PokeCollectionView(vm: HomeViewModel())
    }
}
