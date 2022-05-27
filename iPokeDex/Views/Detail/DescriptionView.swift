//
//  DescriptionView.swift
//  iPokeDex
//
//  Created by Fandrian Rhamadiansyah on 26/05/22.
//

import SwiftUI

struct DescriptionView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var vm: DetailViewModel
    
    init(_ poke: Pokemon) {
        _vm = StateObject(wrappedValue: DetailViewModel(poke))
    }
    
    var body: some View {
        VStack(spacing: 5) {
            
            // image
            AsyncImage(url: URL(string: vm.poke.spriteUrl)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 250, maxHeight: 250)
            } placeholder: {
                ProgressView()
            }
            .padding(10)
            
            
            //title
            Text(vm.poke.name.capitalized)
                .pokeWhiteText(.title, borderWidth: 3)
            
            if let model = vm.model {
                
                HStack {
                    //title
                    Text("Height : \(model.height)")
                        .font(.subheadline)
                        .padding(.horizontal,30)
                        Spacer()
                    Text("Weight : \(model.weight)")
                        .font(.subheadline)
                        .padding(.horizontal,50)
                }
                .foregroundColor(.black)
                .padding(10)
                .background(content: {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.white)
                })
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.black, lineWidth: 1)
                }
                .padding()
                
                // type
                HStack(spacing: 10) {
                    ForEach(model.types, id: \.self) { type in
                        Text(type.rawValue.uppercased())
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(10)
                            .background(content: {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(type.getColor())
                            })
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            }
                            .frame(maxWidth: .infinity)
                    }
                    
                    
                }
                .padding()
                
                
                
                
                
                // Status
                StatsView(vm: vm)
                
                Spacer()
            }
            
            
        }
        .modifier(ErrorHandle(showError: $vm.showError, error: vm.error, completion: { }))
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("#\(vm.poke.pokemonId) \(vm.poke.name.capitalized)")
        .onAppear {
            vm.loadDetails(url: vm.poke.url)
        }
        .gesture(DragGesture(minimumDistance: 20, coordinateSpace: .local)
            .onEnded({ value in
                if value.translation.width > 0 {
                    self.presentationMode.wrappedValue.dismiss()
                }
                
                
            })
        )
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(Pokemon())
    }
}
