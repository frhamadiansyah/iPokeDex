//
//  DetailViewModel.swift
//  iPokeDex
//
//  Created by Fandrian Rhamadiansyah on 25/05/22.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    let service: Requestable
    
    var cancel = Set<AnyCancellable>()
    
    @Published var model: PokemonDetail?
    
    @Published var poke: Pokemon
    
    @Published var showError = false
    @Published var error: Error?
    
    
    init(_ poke: Pokemon, service: Requestable = APIService()) {
        self.poke = poke
        self.service = service
    }
    
    func loadDetails(url: String) {
        let request = URLRequest(url: URL(string: url)!)
        service.makes(request: request, decoder: JSONDecoder())
            .compactMap { response -> PokemonDetail? in
                return response
            }
            .sink { response in
                switch response {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    self.showError = true
                    self.error = error
                }
            } receiveValue: { detail in
                self.model = detail
            }.store(in: &cancel)
    }
    
    
}
