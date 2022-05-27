//
//  HomeView.swift
//  iPokeDex
//
//  Created by Fandrian Rhamadiansyah on 26/05/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeViewModel()
    var body: some View {
        NavigationView {
            VStack {
                PokeCollectionView(vm: vm)
                    .searchable(text: $vm.searchKeyword)
            }
            .modifier(ErrorHandle(showError: $vm.showError, error: vm.error, completion: { }))
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
