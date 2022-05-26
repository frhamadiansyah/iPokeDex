//
//  DetailView.swift
//  iPokeDex
//
//  Created by Fandrian Rhamadiansyah on 25/05/22.
//

import SwiftUI

struct DetailView: View {
    @StateObject var vm = DetailViewModel()
    
    let urlString: String
    
    var body: some View {
        VStack {
            if let model = vm.model {
                Text(model.name)
                
                Text("Weight: \(model.height)")
                
                Text("Weight: \(model.weight)")
                
            } else if let _ = vm.error {
                Text("ERROR")
            } else {
                ProgressView()
            }
        }
        
        .onAppear {
            vm.loadDetails(url: "https://pokeapi.co/api/v2/pokemon/6000")
        
        }
        .modifier(ErrorHandle(showError: $vm.showError, error: vm.error, completion: {
            print("OK")
        }))
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(urlString: "")
    }
}
