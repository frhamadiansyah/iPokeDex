//
//  ContentView.swift
//  iPokeDex
//
//  Created by Fandrian Rhamadiansyah on 25/05/22.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject var vm = HomeViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.filteredPoke) { poke in
                    NavigationLink {
                        DetailView(urlString: poke.url)
                    } label: {
                        Label {
                            Text(poke.name)
                        } icon: {
                            AsyncImage(url: URL(string: poke.spriteUrl)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            
                        }
                    }

                }
                
            }
            .searchable(text: $vm.searchKeyword)
            .navigationTitle("Home")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



